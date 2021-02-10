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
    let screenSize = UIScreen.main.bounds
    
    init(state: AppState) {
        self.viewModel = SignUpViewModel(authAPI: AuthService(), state: state)
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    VStack(alignment: .leading, spacing: 30) {
                        Spacer().frame(height: screenSize.height/5)
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
                                                 height: 50,
                                                 action: self.viewModel.signUp)
                                        .padding(.horizontal)
                                    Spacer()
                                }
                                
                                Spacer()
                            }.padding(.horizontal, 25)
                            VStack(alignment: .center, spacing: 0) {
                                
                            }
                        }
                    }
                    Spacer()
                }.alert(item: self.$viewModel.statusViewModel) { status in
                    Alert(title: Text(status.title),
                          message: Text("Verification email has been sent! We will verify the phone number now."),
                          dismissButton: .default(Text("OK"), action: {
                            self.verifyActive = true
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
        .navigationBarHidden(true)
        
        
    }
}
