//
//  SettingsView.swift
//  Statis
//
//  Created by Fateh Khan on 10/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    let screenBounds = UIScreen.main.bounds
    var body: some View {
        ZStack {
            Color("AppGreen").edgesIgnoringSafeArea(.all)
            VStack {
                Image("gear_bg")
                    .frame(width: screenBounds.width/3, height: screenBounds.width/3)
                    .offset(x: screenBounds.width/3, y: -screenBounds.width/6)
                Spacer()
            }
            VStack {
                HStack {
                    Image(systemName: "chevron.left")
                    Spacer()
                    Text("Settings")
                        .font(.custom("Poppins-Medium", size: 16))
                    Spacer()
                    EmptyView()
                }
                .foregroundColor(Color.white)
                .padding()
                
                VStack {
                    SettingsItem(title: "Account Info", image: "person.crop.circle", insertSeparator: true, insertToggle: false)
                    SettingsItem(title: "Change Password", image: "lock", insertSeparator: true, insertToggle: false)
                    SettingsItem(title: "Do Not Disturb", image: "nosign", insertSeparator: true, insertToggle: true, toggleValue: true)
                    SettingsItem(title: "Auto Save", image: "square.and.arrow.down.on.square", insertSeparator: true, insertToggle: true, toggleValue: false)
                    SettingsItem(title: "Push Notifications", image: "bell", insertSeparator: true, insertToggle: true, toggleValue: true)
                    SettingsItem(title: "People Near Me", image: "bell", insertSeparator: false, insertToggle: true, toggleValue: false)
                }
                .padding()
                Divider()
                    .padding()
                VStack {
                    SettingsItem(title: "Help & Support", image: "questionmark.circle", insertSeparator: true, insertToggle: false)
                    SettingsItem(title: "About", image: "questionmark.circle", insertSeparator: true, insertToggle: false)
                    SettingsItem(title: "Logout", image: "arrow.left.square", insertSeparator: false, insertToggle: false)
                }
                .padding()
                
                Spacer()
                
                ZStack {
                    VStack {
                        Spacer()
                        Wave(graphWidth: 1, amplitude: 0.2)
                            .foregroundColor(Color.white)
                            .frame(height: 150)
                            .opacity(0.2)
                    }
                    VStack {
                        Spacer()
                        Wave(graphWidth: 1, amplitude: 0.2)
                            .foregroundColor(Color.white)
                            .frame(height: 120)
                            .opacity(0.1)
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            
            
        }
    }
}
struct SettingsItem: View {
    let screenBouns = UIScreen.main.bounds
    let title: String
    let image: String
    let insertSeparator: Bool
    let insertToggle: Bool
    @State var toggleValue = true
    var body: some View {
        VStack {
            HStack {
                Image(systemName: image)
                    .font(.system(size: 16, weight: .light, design: .default))
                    .foregroundColor(.white)
                Text(title)
                    .font(.custom("Poppins-Medium", size: 14))
                    .foregroundColor(Color.white)
                Spacer()
                if insertToggle {
                    CustomToggleButton(toggleValue: $toggleValue)
                        .frame(width: 64)
                }
            }
            if insertSeparator {
                Divider()
            }
        }
    }
}

struct CustomToggleButton: View {
    let screenBouns = UIScreen.main.bounds
    @Binding var toggleValue: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Circle().fill(Color.white).frame(height: 16)
                .offset(x: toggleValue ? -16 : 16, y: 0)
        }
        .background(Capsule().fill(Color.white).opacity(0.6)
                        .frame(width: 24, height: 8))
        .onTapGesture {
            withAnimation {
                toggleValue.toggle()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
