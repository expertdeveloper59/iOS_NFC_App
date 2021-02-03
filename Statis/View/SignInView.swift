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
import GoogleSignIn

struct SignInView: View {
    @State var pushActive = false
    @State var homeActive = false
    @ObservedObject private var viewModel: SignInViewModel
    @State var sheetPresented = false
    @State var user = Auth.auth().currentUser
    
    private var screenSize = UIScreen.main.bounds
    let appState: AppState
    
    init(state: AppState) {
        appState = state
        self.viewModel = SignInViewModel(authAPI: AuthService(), state: state)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SignUpView(state: viewModel.state),
                               isActive: self.$pushActive) {
                    EmptyView()
                }.navigationBarHidden(true)
                
                NavigationLink(destination: HomeView(state: viewModel.state),
                               isActive: self.$homeActive) {
                    EmptyView()
                }.navigationBarHidden(true)
                VStack(alignment: .leading, spacing: 10) {
                    Spacer().frame(height: screenSize.height/5)
                    VStack(alignment: .center, spacing: 10) {
                        HStack {
                            Text("SIGN IN")
                                .font(.custom("Futura", size: 28))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        VStack(alignment: .center, spacing: 25) {
                            CustomTextField(placeHolderText: "E-mail",
                                            text: $viewModel.email, symbolName: "envelope.fill")
                            CustomTextField(placeHolderText: "Password",
                                            text: $viewModel.password,
                                            isPasswordType: true, symbolName: "lock.fill")
                            HStack {
                                Spacer()
                                Button("Forgot Password?") {
                                    self.sheetPresented = true
                                }
                                .foregroundColor(.white)
                            }
                        }.padding(.horizontal, 25)
                        
                        VStack(alignment: .center, spacing: 20) {
                            customButton(title: "SIGN IN",
                                         backgroundColor: UIConfiguration.tintColor,
                                         action: { self.viewModel.login() })
                            Text("OR")
                                .font(.custom("Futura", size: 14))
                                .foregroundColor(.white)
                            HStack(spacing: 20) {
                                Button(action: {self.viewModel.facebookLogin()}, label: {
                                    SocialButton(iconName: "heart.fill", iconColor: .red, backgroundColor: .white)
                                })
                                Button(action: {
                                    GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
                                    
                                    GIDSignIn.sharedInstance()?.signIn()
                                }, label: {
                                    SocialButton(iconName: "bold", iconColor: .white, backgroundColor: .blue)
                                })
                            }
                        }
                        .padding(.top)
                    }
                }
                Spacer()
                Button(action: {
                    self.pushActive = true
                }) {
                    VStack {
                        Text("Don't have an account?")
                            .font(.custom("Futura", size: 18))
                            .foregroundColor(.gray)
                        Text("SIGN UP")
                            .autocapitalization(.allCharacters)
                            .font(.custom("Futura", size: 18))
                            .foregroundColor(Color("AppGreen"))
                    }
                }
            }.alert(item: self.$viewModel.statusViewModel) { status in
                Alert(title: Text(status.title),
                      message: Text(status.message),
                      dismissButton: .default(Text("OK"), action: {
                        if status.title == "Successful" {
                            self.homeActive = true
                        }
                      }))
            }
            .edgesIgnoringSafeArea(.all)
            .background(AuthViewsBackground())
            .sheet(isPresented: $sheetPresented) {
                PasswordResetView(state: appState)
            }
        }
        .onAppear {
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("SIGNIN"), object: nil, queue: .main) { (_) in
                
                // Updating User..
                
                self.user = Auth.auth().currentUser
                self.homeActive = true
            }
        }
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

//struct Arc: Shape {
//    var screenSize = UIScreen.main.bounds
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.addArc(center: CGPoint(x: screenSize.width/8, y: screenSize.height/1.7), radius: 530, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
//        return path
//    }
//}
