//
//  AuthAPI.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import Foundation
import Combine
import FirebaseAuth

protocol AuthAPI {
    func login(email: String, password: String) -> Future<User?, Never>
    func signInWithOTP(OTPCode: String) -> Future<User?, Never>
    func signUp(email: String, password: String, phoneNo: String) -> Future<User?, Never>
    func loginWithFacebook() -> Future<User?, Never>
    func loginWithGoogle() -> Future<User?, Never>
    func initiatePasswordReset(email: String) -> Future<Bool?, Never>
    func updatePassword(OTPCode: String, userEmail: String, password: String) -> Future<User?, Never>
}

