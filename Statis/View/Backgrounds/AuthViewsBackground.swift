//
//  SignupBG.swift
//  Statis
//
//  Created by Fateh Khan on 31/01/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct AuthViewsBackground: View {
    var isSignInScreen = true
    var backgroundImage = ""
    let screenSize = UIScreen.main.bounds
    var body: some View {
        ZStack {
            VStack {
                TiltedCircle()
                Spacer()
            }
            if (isSignInScreen) {
                VStack {
                    Spacer()
                    HalfCircle()
                }
            }
        }
        .background(Color("AppGreen"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct HalfCircle: View {
    let screenSize = UIScreen.main.bounds
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: screenSize.height))
            path.addCurve(to: CGPoint(x: screenSize.width, y: screenSize.height), control1: CGPoint(x: screenSize.width/2, y: screenSize.height/1.25), control2: .init(x: screenSize.width, y: screenSize.height))
            }
        .foregroundColor(.white)
    }
}

struct TiltedCircle: View {
    let screenSize = UIScreen.main.bounds
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: -screenSize.width/4, y: screenSize.height/10))
            path.addCurve(to: CGPoint(x: screenSize.width+10, y: screenSize.height/12), control1: CGPoint(x: screenSize.width/3.2, y: screenSize.height/2.8), control2: .init(x: screenSize.width+10, y: screenSize.height/12))
            path.addLine(to: .init(x: screenSize.width, y: 0))
            path.addLine(to: .init(x: 0, y: 0))
            path.addLine(to: CGPoint(x: -screenSize.width/4, y: screenSize.height/10))
            }
        .foregroundColor(.white)
//        .fill(Color.white)
//        .background(Color.red)
    }
}


struct SignupBG_Previews: PreviewProvider {
    static var previews: some View {
        AuthViewsBackground()
    }
}
