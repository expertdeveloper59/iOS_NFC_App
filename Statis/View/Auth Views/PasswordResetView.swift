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

struct PasswordResetView: View {
    @State var OTPpushActive = false
    @ObservedObject private var viewModel: SignInViewModel
    
    private var screenSize = UIScreen.main.bounds
    
    init(state: AppState) {
        self.viewModel = SignInViewModel(authAPI: AuthService(), state: state)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: OTPView(state: viewModel.state, email: viewModel.email),
                               isActive: self.$OTPpushActive) {
                    EmptyView()
                }.hidden()
                
                Spacer()
                VStack(alignment: .center, spacing: 30) {
                    VStack(alignment: .center, spacing: 25) {
                        
                        Text("Reset Password")
                            .font(.custom("Poppins-Regular", size: 28))
                            .foregroundColor(.white)
                        
                        CustomTextField(placeHolderText: "Email Address",
                                        text: $viewModel.email, symbolName: "envelope.fill", keyboardType: .emailAddress)
                        
                    }.padding(.horizontal, 25)
                    
                    VStack(alignment: .center, spacing: 40) {
                        customButton(title: "SEND",
                                     backgroundColor: Color("AppGreen"),
                                     action: { self.viewModel.verifyEmail() })
                    }
                }
                
                Spacer()
            }.alert(item: self.$viewModel.statusViewModel) { status in
                Alert(title: Text(status.title),
                      message: Text(status.title == "Error" ? "Email was not found" : "If this email is registered with us, an OTP has been sent to your registered phone"),
                      dismissButton: .default(Text("OK"), action: {
                        if status.title == "Successful" {
                            self.OTPpushActive = true
                        }
                      }))
            }
            .background(AuthViewsBackground(isSignInScreen: false, backgroundImage: "forgot-password"))
        }
    }
    
    private func customButton(title: String,
                              backgroundColor: Color,
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


