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

struct PhoneVerificationOTPView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var authCode = ""
    @ObservedObject private var viewModel: SignInViewModel
    
    private var screenSize = UIScreen.main.bounds
    
    init(state: AppState) {
        self.viewModel = SignInViewModel(authAPI: AuthService(), state: state)
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            VStack(alignment: .center, spacing: 30) {
                VStack(alignment: .center, spacing: 25) {
                    
                    Text("Phone Verification")
                        .font(.custom("Poppins-Regular", size: 28))
                        .foregroundColor(.white)
                    
                    PasscodeField(originalText: $authCode)
                    
                }.padding(.horizontal, 25)
                
                VStack(alignment: .center, spacing: 40) {
                    customButton(title: "VERIFY",
                                 backgroundColor: UIConfiguration.tintColor,
                                 action: {
                                    self.viewModel.loginWithOTP(OTPCode: authCode)
                                 })
                        .padding(.vertical)
                }
            }
            
            Spacer()
        }
        .alert(item: self.$viewModel.statusViewModel) { status in
            Alert(title: Text(status.title),
                  message: Text("Phone number has been verified"),
                  dismissButton: .default(Text("OK"), action: {
                    if status.title == "Successful" {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                  }))
        }
        .background(AuthViewsBackground(backgroundImage: "confirmed-password"))
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


