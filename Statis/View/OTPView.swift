//
//  SignUpView.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct OTPView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject private var viewModel: SignInViewModel
    @State var pushActive = false
    @State var resetCode: String = ""
    var associatedEmail: String
    let screenSize = UIScreen.main.bounds
    
    init(state: AppState, email: String) {
        self.viewModel = SignInViewModel(authAPI: AuthService(), state: state)
        self.associatedEmail = email
    }
    
    var body: some View {
        VStack {
            Spacer().frame(height: screenSize.height/5)
            VStack(alignment: .leading, spacing: 30) {
                Text("Reset Password")
                    .font(.custom("Poppins-Regular", size: 28))
                    .foregroundColor(.white)
                    .padding(.leading, 25)
                VStack(alignment: .center, spacing: 35) {
                    HStack {
                        Text("Enter OTP")
                        .font(.custom("Poppins-Regular", size: 18))
                        .foregroundColor(.white)
                        .padding(.leading, 25)
                        Spacer()
                    }
                    VStack(alignment: .center, spacing: 25) {
                        PasscodeField(originalText: $resetCode)
                            .padding(.bottom)
                        
                        HStack {
                            Text("New Password")
                            .font(.custom("Poppins-Regular", size: 18))
                            .foregroundColor(.white)
                            .padding(.leading, 25)
                            Spacer()
                        }
                        CustomTextField(placeHolderText: "Password",
                                        text: $viewModel.password,
                                        isPasswordType: true, symbolName: "lock.fill")
                        HStack {
                            Text("Confirm Password")
                            .font(.custom("Poppins-Regular", size: 18))
                            .foregroundColor(.white)
                            .padding(.leading, 25)
                            Spacer()
                        }
                        CustomTextField(placeHolderText: "Confirm Password",
                                        text: $viewModel.confirmPassword,
                                        isPasswordType: true, symbolName: "lock.fill")
                    }.padding(.horizontal, 25)
                    
                    VStack(alignment: .center, spacing: 40) {
                        customButton(title: "Reset",
                                     backgroundColor: UIConfiguration.AppGreen,
                                     width: screenSize.width/1.2,
                                     height: 50,
                                     action: {
                                        self.viewModel.updatePassword(otp: String(resetCode.prefix(6)), email: associatedEmail)
                                     }
                        )
                        .padding(.horizontal)
                    }
                }
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .alert(item: self.$viewModel.statusViewModel) { status in
            Alert(title: Text(status.title),
                  message: Text(status.message),
                  dismissButton: .default(Text("OK"), action: { presentationMode.wrappedValue.dismiss()
                  }))
        }
        .background(AuthViewsBackground(isSignInScreen: false))
    }
    
    private func customButton(title: String,
                              backgroundColor: UIColor,
                              width: CGFloat,
                              height: CGFloat,
                              action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .modifier(ButtonModifier(font: UIConfiguration.buttonFont,
                                         color: backgroundColor,
                                         textColor: .white,
                                         width: width,
                                         height: height))
        }
    }
}
