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
    
    init(state: AppState) {
        self.viewModel = SignInViewModel(authAPI: AuthService(), state: state)
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: HomeView(state: viewModel.state),
                           isActive: self.$pushActive) {
                EmptyView()
            }.hidden()
            
            Spacer()
            VStack(alignment: .center, spacing: 30) {
                VStack(alignment: .center, spacing: 25) {
                    
                    Text(activityTitle)
                        .font(.custom("Futura", size: 28))
                        .foregroundColor(.white)
                    
                    CustomTextField(placeHolderText: "Email Address",
                                    text: $viewModel.email, symbolName: "envelope.fill")
                    
                }.padding(.horizontal, 25)
                
                VStack(alignment: .center, spacing: 40) {
                    customButton(title: "SEND",
                                 backgroundColor: UIConfiguration.tintColor,
                                 action: { self.viewModel.login() })
                }
            }
            
            Spacer()
        }.alert(item: self.$viewModel.statusViewModel) { status in
            Alert(title: Text(status.title),
                  message: Text(status.message),
                  dismissButton: .default(Text("OK"), action: {
                    if status.title == "Successful" {
                        self.pushActive = true
                    }
                  }))
        }
        .background(SignupBG())
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


