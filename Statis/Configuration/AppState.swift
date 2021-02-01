//
//  AppState.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var user: User?
    var currentUser: User?
}
