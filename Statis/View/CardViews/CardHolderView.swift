//
//  CardHolderView.swift
//  Statis
//
//  Created by Fateh Khan on 10/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct CardHolderView: View {
    let screenBounds = UIScreen.main.bounds
    var body: some View {
        ZStack {
            VStack {
                Color("AppGreen")
                    .frame(height: screenBounds.height/6)
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color.white)
                    Spacer()
                    Text("Holder")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color.white)
                    Spacer()
                    Button (action: {
                        //
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(Color.white)
                            .padding(.all, 8)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white).overlay(RoundedRectangle(cornerRadius: 8).fill(Color("AppGreen")).padding(.all, 2)))
                    }
                    .frame(width: 32, height: 32)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "person")
                            .font(.system(size: 18, weight: .light, design: .default))
                            .foregroundColor(Color("BlackTanText"))
                        Text("Jason Holder")
                            .font(.custom("Poppins-SemiBold", size: 16))
                            .foregroundColor(Color("BlackTanText"))
                        Spacer()
                    }
                    HStack {
                        Image("iconBriefcase")
                            .foregroundColor(Color("BlackTanText").opacity(0.8))
                        Text("Managing Director, Chirp")
                            .font(.custom("Poppins-Regular", size: 13))
                            .foregroundColor(Color("BlackTanText").opacity(0.8))
                        Spacer()
                    }
                }
                .padding(.all, 24)
                .background(ZStack {
                    RoundedRectangle(cornerRadius: 14).fill(Color("CloudyWhite"))
                    VStack {
                        Spacer()
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
                                .cornerRadius(14, corners: [.bottomRight])
                        }
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("Premium")
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(Color.white)
                        }
                        .padding(.trailing)
                    }
                })
                
                
                .padding(.horizontal)
                
                HStack {
                    Text("Cards (4)")
                        .font(.custom("Poppins-Medium", size: 15))
                        .foregroundColor(Color("AppGreen"))
                    Spacer()
                    Text("Manage")
                        .font(.custom("Poppins-Regular", size: 13))
                        .foregroundColor(Color("BlackTanText").opacity(0.8))
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(1...4, id: \.self) { index in
                        BusinessCard(width: screenBounds.width/1.2, height: screenBounds.height/5)
                    }
                }
                
                
            }
            
            CardHolderManageModal()
        }
    }
}


struct CardHolderManageModal: View {
    
    let screenBounds = UIScreen.main.bounds
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        HStack(spacing: 50) {
                            VStack {
                                Image("group")
                                    .foregroundColor(Color("AppGreen"))
                                Text("Set Groups")
                                    .font(.custom("Poppings-Medium", size: 10))
                                    .foregroundColor(Color.black)
                                    .fixedSize()
                            }
                            VStack {
                                Image(systemName: "arrow.up.arrow.down")
                                    .foregroundColor(Color("AppGreen"))
                                Text("Export")
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
                    .padding()
                    .padding(.horizontal).background(
                        ZStack{
                            Rectangle().fill(Color.white)
                                .frame(height: screenBounds.height/4)
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
                                        Text("Manage")
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

struct CardHolderView_Previews: PreviewProvider {
    static var previews: some View {
        CardHolderView()
    }
}
