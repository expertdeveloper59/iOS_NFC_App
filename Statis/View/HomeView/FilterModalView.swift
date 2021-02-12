//
//  FilterModalView.swift
//  Statis
//
//  Created by Fateh Khan on 10/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct FilterModalView: View {
    let screenBounds = UIScreen.main.bounds
    @Binding var title: String
    @Binding var batch: String
    @Binding var management: String
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        HStack {
                            Spacer()
                            
                        }
                        HStack {
                            TextField("Title", text: $title)
                                .padding()
                                .background(Capsule().fill(Color("CloudyWhite")))
                            HStack {
                                TextField("Batch", text: $batch)
                                //                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(Color.gray.opacity(0.5))
                            }.padding()
                            .background(Capsule().fill(Color("CloudyWhite")))
                        }
                        TextField("Management as the last title", text: $title)
                            .padding()
                            .background(Capsule().fill(Color("CloudyWhite")))
                        Divider()
                            .padding(.vertical)
                        HStack(spacing: 50) {
                            VStack {
                                Image("import")
                                    .foregroundColor(Color("AppGreen"))
                                Text("Import")
                                    .font(.custom("Poppings-Medium", size: 13))
                                    .foregroundColor(Color.black)
                                    .fixedSize()
                            }
                            VStack {
                                Image("group")
                                    .foregroundColor(Color("AppGreen"))
                                Text("Group")
                                    .font(.custom("Poppings-Medium", size: 13))
                                    .foregroundColor(Color.black)
                                    .fixedSize()
                            }
                            VStack {
                                Image("saveIcon")
                                Text("Save")
                                    .font(.custom("Poppings-Medium", size: 13))
                                    .foregroundColor(Color.black)
                                    .fixedSize()
                            }
                            VStack {
                                Image("menuVertical")
                                Text("More")
                                    .font(.custom("Poppings-Medium", size: 13))
                                    .foregroundColor(Color.black)
                                    .fixedSize()
                            }
                        }
                        .padding(.bottom)
                    }
                    .padding().background(
                        ZStack{
                            Rectangle().fill(Color.white)
                                    .frame(height: screenBounds.height/3)
                                    .cornerRadius(29, corners: [.topLeft, .topRight])
                            VStack {
                                ZStack {
                                    HStack(spacing: 0) {
                                        Spacer()
                                        VStack(spacing: 0) {
                                            Triangle()
                                                .fill(Color("AppGreen"))
                                                .frame(width: 18, height: 18)
                                                .rotationEffect(.degrees(180))
                                            Triangle()
                                                .fill(Color("AppGreen"))
                                                .frame(width: 18, height: 18)
                                                .rotation3DEffect(.degrees(360), axis: (x: 0, y: 0, z: 1))
                                                .rotationEffect(.degrees(-90))
                                            
                                        }
                                        Rectangle().fill(Color("AppGreen"))
                                                        .frame(width: 96, height: 36)
                                                .cornerRadius(29, corners: [.topRight])
                                    }
                                    HStack {
                                        Spacer()
                                        Text("Filter by")
                                            .font(.custom("Poppings-Medium", size: 13))
                                            .foregroundColor(Color.white)
                                            .fixedSize()
                                            .padding(.trailing)
                                    }
                                    
                                }
                                Spacer()
                                
                            }})
                    Spacer()
                }
            }
            .background(Color.gray.opacity(0.6).edgesIgnoringSafeArea(.all))
        }
        .edgesIgnoringSafeArea(.all)
    }
}
