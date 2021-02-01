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

struct SignInView: View {
    @State var pushActive = false
    @ObservedObject private var viewModel: SignInViewModel
    
    private var screenSize = UIScreen.main.bounds
    
    init(state: AppState) {
        self.viewModel = SignInViewModel(authAPI: AuthService(), state: state)
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: HomeView(state: viewModel.state),
                           isActive: self.$pushActive) {
              EmptyView()
            }.hidden()
            VStack(alignment: .leading, spacing: 30) {
                
                Spacer().frame(width: 100, height: screenSize.height/7, alignment: .center)
                VStack(alignment: .center, spacing: 30) {
                    Text("SIGN IN")
                        .font(.custom("Futura", size: 28))
                        .foregroundColor(.white)
                    VStack(alignment: .center, spacing: 25) {
                        CustomTextField(placeHolderText: "E-mail",
                                        text: $viewModel.email, symbolName: "envelope.fill")
                        CustomTextField(placeHolderText: "Password",
                                      text: $viewModel.password,
                                      isPasswordType: true, symbolName: "lock.fill")
                        HStack {
                            Spacer()
                            Button("Forgot Password?") {
                                print("Forgot Password")
                            }
                            .foregroundColor(.white)
                        }
                    }.padding(.horizontal, 25)
                    
                    VStack(alignment: .center, spacing: 40) {
                        customButton(title: "SIGN IN",
                                     backgroundColor: UIConfiguration.tintColor,
                                     action: { self.viewModel.login() })
                        Text("OR")
//                        customButton(title: "Facebook Login",
//                                     backgroundColor: UIColor(hexString: "#334D92"),
//                                     action: { self.viewModel.facebookLogin() })
                        HStack(spacing: 20) {
                            Button(action: {}, label: {
                                SocialButton(iconName: "heart.fill", iconColor: .red, backgroundColor: .white)
                            })
                            Button(action: {
                                self.viewModel.facebookLogin()
                            }, label: {
                                SocialButton(iconName: "heart.fill", iconColor: .white, backgroundColor: .blue)
                            })
                        }
                    }
                }
            }
            Spacer()
            VStack {
                Text("sign ?")
                    .font(.custom("Futura", size: 28))
                    .foregroundColor(.white)
                Text("Sign up")
                    .font(.custom("Futura", size: 28))
                    .foregroundColor(.white)
            }
            .edgesIgnoringSafeArea(.all)
            .background(Arc().foregroundColor(Color.white))
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


struct SocialButton: View {
    var iconName = "heart.fill"
    var iconColor = Color.white
    var backgroundColor = Color.white
    var body: some View {
        Image(systemName: iconName)
            .padding()
            .background(backgroundColor)
            .foregroundColor(iconColor)
            .clipShape(Circle())
    }
}

struct Arc: Shape {
    var screenSize = UIScreen.main.bounds

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: screenSize.width/8, y: screenSize.height/1.7), radius: 530, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
        return path
    }
}
