//
//  SignUpView.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import SwiftUI
import Combine
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth

struct EmailVerificationView: View {
    @State var pushActive = false
    @ObservedObject private var viewModel: SignInViewModel
    
    private var screenSize = UIScreen.main.bounds
    var activityTitle = "Email Verification"
    
    init(state: AppState, title: String) {
        self.viewModel = SignInViewModel(authAPI: AuthService(), state: state)
        activityTitle = title
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: HomeView(state: viewModel.state),
                           isActive: self.$pushActive) {
                EmptyView()
            }.hidden()
            
            Spacer().frame(height: screenSize.height/5)
            VStack(alignment: .center, spacing: 30) {
                VStack(alignment: .center, spacing: 25) {
                    
                    Text(activityTitle)
                        .font(.custom("Poppins-Regular", size: 28))
                        .foregroundColor(.white)
                    
                    CustomTextField(placeHolderText: "Email Address",
                                    text: $viewModel.email, symbolName: "envelope.fill", keyboardType: .emailAddress)
                    
                }.padding(.horizontal, 25)
                
                VStack(alignment: .center, spacing: 40) {
                    customButton(title: "SEND",
                                 backgroundColor: UIConfiguration.tintColor,
                                 action: { self.viewModel.verifyEmail() })
                }
            }
            
            Spacer()
        }.alert(item: self.$viewModel.statusViewModel) { status in
            Alert(title: Text(status.title),
                  message: Text("OTP has been sent"),
                  dismissButton: .default(Text("OK"), action: {
                    if status.title == "Successful" {
                        self.pushActive = true
                    }
                  }))
        }
        .background(AuthViewsBackground(isSignInScreen: false, backgroundImage: "confirmed-password"))
        .edgesIgnoringSafeArea(.all)
    }
    
    private func customButton(title: String,
                              backgroundColor: UIColor,
                              action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .modifier(ButtonModifier(font: UIConfiguration.buttonFont,
                                         color: backgroundColor,
                                         textColor: .white,
                                         width: 275,
                                         height: 55))
        }
    }
}


