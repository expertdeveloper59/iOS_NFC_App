//
//  AuthService.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import Foundation
import Combine
import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn

class AuthService: AuthAPI {
    
    func loginWithGoogle() -> Future<User?, Never> {
        return Future<User?, Never> { promise in
            let loginManager = LoginManager()
            loginManager.logIn(permissions: ["email"], from: nil) { (result, error) in
                guard let token = AccessToken.current, error == nil else {
                    promise(.success(nil))
                    return
                }
                
//                guard let authentication = GIDGoogleUser.au
                
                Auth.auth().signIn(with: GoogleAuthProvider.credential(withIDToken: token.userID, accessToken: token.tokenString), completion: { (firebaseUser, error) in
                    if error != nil {
                        promise(.success(nil))
                        return
                    }
                    guard let id = firebaseUser?.user.providerID,
                        let email = firebaseUser?.user.email else {
                            promise(.success(nil))
                            return
                    }
                    let user = User(id: id, email: email)
                    promise(.success(user))
                })
            }
        }
    }
    
    
    func loginWithFacebook() -> Future<User?, Never> {
        return Future<User?, Never> { promise in
            let loginManager = LoginManager()
            loginManager.logIn(permissions: ["email"], from: nil) { (result, error) in
                guard let token = AccessToken.current, error == nil else {
                    promise(.success(nil))
                    return
                }
                Auth.auth().signIn(with: FacebookAuthProvider.credential(withAccessToken: token.tokenString), completion: { (firebaseUser, error) in
                    if error != nil {
                        promise(.success(nil))
                        return
                    }
                    guard let id = firebaseUser?.user.providerID,
                        let email = firebaseUser?.user.email else {
                            promise(.success(nil))
                            return
                    }
                    let user = User(id: id, email: email)
                    promise(.success(user))
                })
            }
        }
    }
    
    func login(email: String, password: String) -> Future<User?, Never> {
        return Future<User?, Never> { promise in
            Auth.auth().signIn(withEmail: email, password: password) {(authResult, _) in
                guard let id = authResult?.user.providerID,
                    let email = authResult?.user.email else {
                        promise(.success(nil))
                        return
                }
                let user = User(id: id, email: email)
                promise(.success(user))
            }
        }
    }
    
    func verifyEmail(email: String) -> Future<Bool?, Never> {
        return Future<Bool?, Never> { promise in
            Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                if let anError = error {
                    print(anError.localizedDescription)
                } else {
                    promise(.success(true))
                }
            }
        }
    }
    
    func signUp(email: String, password: String) -> Future<User?, Never> {
        return Future<User?, Never> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, _) in
                guard let id = authResult?.user.providerID,
                    let email = authResult?.user.email else {
                        promise(.success(nil))
                        return
                }
                let user = User(id: id, email: email)
                promise(.success(user))
            }
        }
    }
}
