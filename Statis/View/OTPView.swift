//
//  SignUpView.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import SwiftUI

struct OTPView: View {
    @ObservedObject private var viewModel: SignUpViewModel
    @State var pushActive = false
    @State var resetCode: String = ""
    let screenSize = UIScreen.main.bounds
    
    init(state: AppState) {
        self.viewModel = SignUpViewModel(authAPI: AuthService(), state: state)
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: HomeView(state: viewModel.state),
                           isActive: self.$pushActive) {
                EmptyView()
            }.hidden()
            VStack(alignment: .leading, spacing: 30) {
                Spacer().frame(width: 100, height: screenSize.height/7, alignment: .center)
                Text("SIGN UP")
                    .font(.custom("Futura", size: 28))
                    .foregroundColor(.white)
                    .padding(.leading, 25)
                VStack(alignment: .center, spacing: 35) {
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
                                     action: self.viewModel.signUp
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
        .background(SignupBG())
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
