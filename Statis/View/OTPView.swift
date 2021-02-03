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
//            NavigationLink(destination: HomeView(state: viewModel.state),
//                           isActive: self.$pushActive) {
//                EmptyView()
//            }.hidden()
            VStack(alignment: .leading, spacing: 30) {
                Spacer().frame(width: 100, height: screenSize.height/7, alignment: .center)
                Text("Reset Password")
                    .font(.custom("Futura", size: 28))
                    .foregroundColor(.white)
                    .padding(.leading, 25)
                VStack(alignment: .center, spacing: 35) {
                    Text("Enter OTP")
                    .font(.custom("Futura", size: 18))
                    .foregroundColor(.white)
                    .padding(.leading, 25)
                    VStack(alignment: .center, spacing: 25) {
                        PasscodeField(originalText: $resetCode)
                        CustomTextField(placeHolderText: "Password",
                                        text: $viewModel.password,
                                        isPasswordType: true, symbolName: "lock.fill")
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
                                        self.viewModel.updatePassword(otp: resetCode, email: associatedEmail)
                                     }
//                                     action: self.viewModel.signUp
                        )
                        .padding(.horizontal)
                    }
                }
            }
            Spacer()
        }.alert(item: self.$viewModel.statusViewModel) { status in
            Alert(title: Text(status.title),
                  message: Text(status.message),
                  dismissButton: .default(Text("OK"), action: { self.pushActive = true }))
        }
        .background(AuthViewsBackground())
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
