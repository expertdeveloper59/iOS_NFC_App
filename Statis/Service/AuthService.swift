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
import FirebaseFirestore

class AuthService: AuthAPI {
    
    
    private let firestoreVM = FirestoreViewModel()
    
    func loginWithGoogle() -> Future<User?, Never> {
        return Future<User?, Never> { promise in
            let loginManager = LoginManager()
            loginManager.logIn(permissions: ["email"], from: nil) { (result, error) in
                guard let token = AccessToken.current, error == nil else {
                    promise(.success(nil))
                    return
                }
                
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
                
                if let isEmailVerified = authResult?.user.isEmailVerified {
                    if (isEmailVerified == true) {
                        let user = User(id: id, email: email)
                        promise(.success(user))
                    } else {
                        promise(.success(nil))
                        return
                    }
                }
            }
        }
    }
    
    func initiatePasswordReset(email: String) -> Future<Bool?, Never> {
        return Future<Bool?, Never> { promise in
            
            self.firestoreVM.getUser(email) { phoneNumber in
                if phoneNumber == "nil" {
                    print("User not found")
                    promise(.success(false))
                } else {
                    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
                        if let error = error {
                            print("Err0r: ", error.localizedDescription)
                            promise(.success(false))
                            
                        } else {
                            print("Verification ID", verificationID ?? "None!")
                            if let verificationID = verificationID {
                                UserDefaults.standard.setValue(verificationID, forKey: "verifId")
                                promise(.success(true))
                            }                 }
                    }
                }
            }
        }
    }
    
    
    func signUp(email: String, password: String, phoneNo: String) -> Future<User?, Never> {
        return Future<User?, Never> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, _) in
                guard let id = authResult?.user.providerID,
                      let email = authResult?.user.email else {
                    promise(.success(nil))
                    return
                }
                self.firestoreVM.addUser(.init(userEmail: email, phoneNo: phoneNo))
                authResult?.user.sendEmailVerification(completion: { (_) in
                    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNo, uiDelegate: nil) { (verificationID, error) in
                        if let error = error {
                            print("Err0r: ", error.localizedDescription)
                            promise(.success(nil))
                            
                        } else {
                            print("sent code on: ", phoneNo)
                            if let verificationID = verificationID {
                                UserDefaults.standard.setValue(verificationID, forKey: "verifId")
                                let user = User(id: id, email: email)
                                promise(.success(user))
                            } else {
                                promise(.success(nil))
                            }
                        }
                    }
                })
            }
        }
    }
    
    func signInWithOTP(OTPCode: String) -> Future<User?, Never> {
        print("Now signing in with OTP")
        return Future<User?, Never> { promise in
            var credential: AuthCredential
            if let verifID = UserDefaults.standard.value(forKey: "verifId") as? String {
                credential = PhoneAuthProvider.provider().credential(
                    withVerificationID: verifID,
                    verificationCode: OTPCode)
                Auth.auth().currentUser?.link(with: credential, completion: { (dataResult, error) in
                    if let error = error {
                        print("Error::", error.localizedDescription)
                    } else {
                        if let id = dataResult?.user.providerID {
                            let user = User(id: id, email: "email")
                            promise(.success(user))
                        }
                    }
                })
            }
        }
    }
    
    func updatePassword(OTPCode: String, userEmail: String, password: String) -> Future<User?, Never> {
        return Future<User?, Never> { promise in
            var credential: AuthCredential
            if let verifID = UserDefaults.standard.value(forKey: "verifId") as? String {
                credential = PhoneAuthProvider.provider().credential(
                    withVerificationID: verifID,
                    verificationCode: OTPCode)
                
                
                print("OTP", OTPCode)
                print("Password", password)
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let error = error {
                        print("Error in AuthService: ", error.localizedDescription)
                    }
                    Auth.auth().currentUser?.updatePassword(to: password) { (error) in
                        if let error = error {
                            print(error.localizedDescription)
                            promise(.success(nil))
                        } else {
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
        }
    }
    
    func sendAuthCode(phoneNumber: String, completion: @escaping (_ status: String)->()) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                print("Err0r: ", error.localizedDescription)
                completion("failed")
                
            } else {
                print("Verification ID", verificationID ?? "None!")
                if let id = verificationID {
                    UserDefaults.standard.setValue(id, forKey: "verifId")
                    completion("")
                } else {
                    completion("failed")
                }
            }
        }
    }
    
}
