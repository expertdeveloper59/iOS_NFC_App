
//  SplashView.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//
import SwiftUI
import FirebaseAuth

struct SplashView: View {
    @State var isActive:Bool = false
    @ObservedObject var state: AppState
    
    var body: some View {
        VStack {
            if self.isActive {
                if ((state.user?.isEmailVerified) != nil) {
                    HomeView(state: state, isDrawerOpen: false )
                } else {
                    SignInView(state: state)
                }
            } else {
                ZStack {
                    Color(UIConfiguration.tintColor)
                        .edgesIgnoringSafeArea(.all)
                    Image("logo")
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                }
            }
        }
        .onAppear {
            if ((Auth.auth().currentUser?.isEmailVerified) != nil && (Auth.auth().currentUser?.isEmailVerified)! == true) {
                state.user = User(id: "", email: "")
                state.user?.isEmailVerified = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
