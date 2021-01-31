//
//  AppState.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var user: User?
    var currentUser: User?
}
