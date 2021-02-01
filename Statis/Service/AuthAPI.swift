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
    func signUp(email: String, password: String) -> Future<User?, Never>
    func loginWithFacebook() -> Future<User?, Never>
}
