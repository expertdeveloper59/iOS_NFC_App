//
//  SignupBG.swift
//  Statis
//
//  Created by Fateh Khan on 31/01/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct AuthViewsBackground: View {
    let screenSize = UIScreen.main.bounds
    var body: some View {
        ZStack {
            VStack {
                TiltedCircle()
                Spacer()
            }
            VStack {
                Spacer()
                HalfCircle()
            }
        }
        .background(Color("AppGreen"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct SignupBG_Previews: PreviewProvider {
    static var previews: some View {
        AuthViewsBackground()
    }
}
