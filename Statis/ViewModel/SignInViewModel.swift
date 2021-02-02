//
//  SignInViewModel.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import Combine
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth

class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var statusViewModel: StatusViewModel?
    @Published var state: AppState
    
    private var cancellableBag = Set<AnyCancellable>()
    private let authAPI: AuthAPI
    
    init(authAPI: AuthAPI, state: AppState) {
        self.authAPI = authAPI
        self.state = state
    }
    
    func login() {
        authAPI.login(email: email, password: password)
            .receive(on: RunLoop.main)
            .map(resultMapper)
            .replaceError(with: StatusViewModel.errorStatus)
            .assign(to: \.statusViewModel, on: self)
            .store(in: &cancellableBag)
    }
    
    func verifyEmail() {
        authAPI.initiatePasswordReset(email: email)
            .receive(on: RunLoop.main)
            .map(verifResultMapper)
            .assign(to: \.statusViewModel, on: self)
            .store(in: &cancellableBag)
    }
    
    func facebookLogin() {
        authAPI.loginWithFacebook()
            .receive(on: RunLoop.main)
            .map(resultMapper)
            .replaceError(with: StatusViewModel.errorStatus)
            .assign(to: \.statusViewModel, on: self)
            .store(in: &cancellableBag)
    }
    
    func updatePassword(otp: String, email: String) {
        authAPI.updatePassword(OTPCode: otp, userEmail: email, password: self.password)
            .receive(on: RunLoop.main)
            .map(resultMapper)
            .replaceError(with: StatusViewModel.errorStatus)
            .assign(to: \.statusViewModel, on: self)
            .store(in: &cancellableBag)
    }
    
    func googleLogin() {
        authAPI.loginWithGoogle()
            .receive(on: RunLoop.main)
            .map(resultMapper)
            .replaceError(with: StatusViewModel.errorStatus)
            .assign(to: \.statusViewModel, on: self)
            .store(in: &cancellableBag)
    }
}

// MARK: - Private helper function
extension SignInViewModel {
    private func resultMapper(with user: User?) -> StatusViewModel {
        if user != nil {
            state.currentUser = user
            return StatusViewModel.logInSuccessStatus
        } else {
            return StatusViewModel.errorStatus
        }
    }
    
    private func verifResultMapper(with bool: Bool?) -> StatusViewModel {
        if bool != false {
//            state.currentUser = user
            return StatusViewModel.logInSuccessStatus
        } else {
            return StatusViewModel.errorStatus
        }
    }
}
