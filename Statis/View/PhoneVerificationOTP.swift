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
//    @Binding var thisViewActive: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var authCode = ""
    @ObservedObject private var viewModel: SignInViewModel
    
    private var screenSize = UIScreen.main.bounds
    
    init(state: AppState) {
        self.viewModel = SignInViewModel(authAPI: AuthService(), state: state)
//        self.thisViewActive = thisViewActive
    }
    
    var body: some View {
        VStack {
//            NavigationLink(destination: HomeView(state: viewModel.state),
//                           isActive: self.$pushActive) {
//                EmptyView()
//            }.hidden()
            
            Spacer()
            VStack(alignment: .center, spacing: 30) {
                VStack(alignment: .center, spacing: 25) {
                    
                    Text("Email Verification")
                        .font(.custom("Futura", size: 28))
                        .foregroundColor(.white)
                    
                    PasscodeField(originalText: $authCode)
                    
//                    CustomTextField(placeHolderText: "Email Address",
//                                    text: $viewModel.email, symbolName: "envelope.fill")
                    
                }.padding(.horizontal, 25)
                
                VStack(alignment: .center, spacing: 40) {
                    customButton(title: "VERIFY",
                                 backgroundColor: UIConfiguration.tintColor,
                                 action: {
//                                    thisViewActive = false
//                                    AuthService().signInWithOTP(OTPCode: authCode)
                                    self.viewModel.loginWithOTP(OTPCode: authCode)
                                 })
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
        .background(AuthViewsBackground())
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


