//
//  SignUpView.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject private var viewModel: SignUpViewModel
    @State var pushActive = false
    @State var verifyActive = false
    @State var allFieldsDoneError = false
    let screenSize = UIScreen.main.bounds
    
    init(state: AppState, signUpActive: Bool) {
        self.viewModel = SignUpViewModel(authAPI: AuthService(), state: state)
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().tintColor = .clear
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    VStack(alignment: .leading, spacing: 22) {
                        Spacer().frame(height: screenSize.height/6)
                        Text("SIGN UP")
                            .font(.custom("Poppins-Regular", size: 28))
                            .foregroundColor(.white)
                            .padding(.leading, 25)
                            .padding(.top)
                        VStack(alignment: .center, spacing: 0) {
                            VStack(alignment: .center, spacing: 0) {
                                VStack {
                                    CustomTextField(placeHolderText: "Name",
                                                    text: $viewModel.fullName, symbolName: "person.fill")
                                    CustomTextField(placeHolderText: "E-mail Address",
                                                    text: $viewModel.email, symbolName: "envelope.fill", keyboardType: .emailAddress)
                                    CustomTextField(placeHolderText: "Phone Number (+XXXXXXXXXXX)",
                                                    text: $viewModel.phoneNumber, symbolName: "phone.fill")
                                    CustomTextField(placeHolderText: "Username",
                                                    text: $viewModel.username, symbolName: "person.fill")
                                    CustomTextField(placeHolderText: "Password",
                                                    text: $viewModel.password,
                                                    isPasswordType: true, symbolName: "lock.fill")
                                    CustomTextField(placeHolderText: "Confirm Password",
                                                    text: $viewModel.confirmPassword,
                                                    isPasswordType: true, symbolName: "lock.fill")
                                    
                                    Spacer()
                                    customButton(title: "SIGN UP",
                                                 backgroundColor: Color("AppGreen"),
                                                 width: screenSize.width/1.2,
                                                 height: 48,
                                                 action: {
                                                    if (viewModel.email.isEmpty
                                                            || viewModel.username.isEmpty
                                                            || viewModel.password.isEmpty
                                                            || viewModel.email.isEmpty
                                                            || viewModel.confirmPassword.isEmpty
                                                            || viewModel.phoneNumber.isEmpty) {
                                                        print("All Empty")
                                                        self.allFieldsDoneError = true
                                                        self.viewModel.statusViewModel = StatusViewModel(title: "Error", message: "Please enter details in all fields")
                                                    } else if (viewModel.password != viewModel.confirmPassword) {
                                                        self.allFieldsDoneError = true
                                                        self.viewModel.statusViewModel = StatusViewModel(title: "Error", message: "Passwords do not match")
                                                    } else {
                                                        self.viewModel.signUp()
                                                    }
                                                 })
                                        .padding(.horizontal)
                                    Spacer()
                                }
                                Spacer()
                            }.padding(.horizontal, 25)
                        }
                    }
                    Spacer()
                }.alert(item: self.$viewModel.statusViewModel) { status in
                    Alert(title: Text(status.title),
                          message: Text(status.message),
                          dismissButton: .default(Text("OK"), action: {
                            if status.title != "Error" {
                                self.verifyActive = true
                            }
                          }))
                }
                .edgesIgnoringSafeArea(.all)
                .background(AuthViewsBackground(isSignInScreen: false))
            }
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: self.$verifyActive, onDismiss: {
                presentationMode.wrappedValue.dismiss()
            }) {
                PhoneVerificationOTPView(state: self.viewModel.state)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        
        
    }
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "arrow.left")
                .foregroundColor(.black)
            Text("Go back")
        }
        .background(Color.clear)
    }
    }
}
