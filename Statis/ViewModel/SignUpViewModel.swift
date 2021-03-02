//
//  SignUpViewModel.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var fullName: String = ""
    @Published var phoneNumber: String = ""
    @Published var statusViewModel: StatusViewModel?
    @Published var state: AppState
    @Published var requestProcessing: Bool = false
    
    private var cancellableBag = Set<AnyCancellable>()
    private let authAPI: AuthAPI
    
    init(authAPI: AuthAPI, state: AppState) {
        self.authAPI = authAPI
        self.state = state
    }
    
    func signUp() {
        if (email.isEmpty || username.isEmpty || password.isEmpty || fullName.isEmpty || phoneNumber.isEmpty) {
            statusViewModel = StatusViewModel(title: "Error", message: "Please fill all fields")
        } else if password != confirmPassword {
            statusViewModel = StatusViewModel(title: "Error", message: "Passwords do not match.")
        } else {
            self.requestProcessing = true
            authAPI.signUp(email: email, password: password, phoneNo: phoneNumber)
                .receive(on: RunLoop.main)
                .map(resultMapper)
                .replaceError(with: StatusViewModel.errorStatus)
                .assign(to: \.statusViewModel, on: self)
                .store(in: &cancellableBag)
        }
        
    }
    
    func changeProcessingState() {
        self.requestProcessing.toggle()
    }
}

// MARK: - Private helper function
extension SignUpViewModel {
    private func resultMapper(with user: User?) -> StatusViewModel {
        if user != nil {
            state.currentUser = user
            return StatusViewModel.signUpSuccessStatus
        } else {
            let errorStatus = StatusViewModel(title: "Error", message: "")
            if let errorMsg = UserDefaults.standard.value(forKey: "RegError") as? String
            {
                errorStatus.message = errorMsg
            }
            return errorStatus
        }
    }
}
