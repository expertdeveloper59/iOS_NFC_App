//
//  StatusViewModel.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import Foundation

class StatusViewModel: Identifiable, ObservableObject {
    
    var title: String
    var message: String
    
    init(title: String = "", message: String = "") {
        self.title = title
        self.message = message
    }
    
    static var signUpSuccessStatus: StatusViewModel {
        return StatusViewModel(title: "Successful", message: "Your account has been created successfully")
    }
    
    static var logInSuccessStatus: StatusViewModel {
        return StatusViewModel(title: "Successful", message: "Your account has been logged in successfully")
    }
    
    static var errorStatus: StatusViewModel {
        return StatusViewModel(title: "Error", message: "Oops! Something went wrong. Please try again.")
    }
    
    static var validationStatus: StatusViewModel {
        return StatusViewModel(title: "Error", message: "Oops! Passwords do not match. Please try again.")
    }
}
