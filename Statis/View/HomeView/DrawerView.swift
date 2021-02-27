//
//  DrawerView.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct DrawerContent: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showSuccess = false
    var body: some View {
        ZStack {
            Color.white
            VStack {
                HStack {
                    Image("IDphoto")
                        .resizable()
                        .aspectRatio(contentMode: ContentMode.fit)
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text("Hamza Shahbaz")
                            .font(.custom("Poppings-Medium", size: 15))
                            .foregroundColor(Color("BlackTanText"))
                        Text("Managing Director, states")
                            .font(.custom("Poppings-Regular", size: 11))
                            .foregroundColor(Color("CardQuesColor"))
                    }
                    Spacer()
                }
                .padding()
                Divider()
                    .padding(.horizontal)
                VStack {
                    SidebarMenuItem(imageName: "wallet", title: "Wallet") {
                        
                    }
                    SidebarMenuItem(imageName: "transfer", title: "Transfer contact cards") {
                        
                    }
                    SidebarMenuItem(imageName: "batch", title: "Batching") {
                        
                    }
                    SidebarMenuItem(imageName: "manage", title: "Managing") {
                        
                    }
                    SidebarMenuItem(imageName: "filter", title: "Filter / Sorting") {
                        
                    }
//                    Spacer()
                    Button(action: {
                        do {
                            try Auth.auth().signOut()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }) {
                        Text("Logout")
                            .font(.custom("Poppins-Medium", size: 15))
                            .foregroundColor(Color("BlackTanText"))
                    }
                    .padding()
                }
                Spacer()
                
            }
            .alert(isPresented: self.$showSuccess, content: {
                .init(title: Text("Logout Successfuly"))
            })
        }
    }
}

struct SidebarMenuItem: View {
    let imageName: String
    let title: String
    let action: () -> ()
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(imageName)
                    .foregroundColor(Color.gray)
                    .font(Font.title.weight(.thin))
                    .frame(width: 30, height: 30, alignment: .center)
                Text(title)
                    .font(.custom("Poppins-Medium", size: 15))
                    .foregroundColor(Color("BlackTanText"))
                
                Spacer()
                
            }
            Divider()
                .padding(.horizontal)
        }
        .padding(.horizontal)
        .onTapGesture {
            action()
        }
    }
}

struct DrawerView: View {
    private let width = UIScreen.main.bounds.width - 100
    @Binding var isOpen: Bool
    
    var body: some View {
        HStack {
            DrawerContent()
                .padding(.top)
                .frame(width: self.width)
                .offset(x: self.isOpen ? 0 : -self.width)
                .edgesIgnoringSafeArea(.vertical)
                .animation(.default)
            Spacer()
        }.onTapGesture {
            self.isOpen.toggle()
        }
    }
}
