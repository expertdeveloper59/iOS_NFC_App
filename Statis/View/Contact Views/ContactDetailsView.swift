//
//  ContactDetailsView.swift
//  Statis
//
//  Created by Fateh Khan on 12/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct BusinessCardDetailsSecondaryView: View {
    let screenBounds = UIScreen.main.bounds
    let items = [
        ["user", "Full Name", "Alexndar Jole"],
        ["iconPhone", "Phone", "+9293334040"],
        ["iconMail", "Email Address", "email@inofr.com"],
        ["iconBuilding", "Company", "Redf Inc."],
        ["iconBuilding", "Job Title", "Awsm"]
    ]
    var body: some View {
        ZStack {
            VStack {
                Rectangle().fill(Color("AppGreen"))
                    .frame(height: screenBounds.height/6)
                    .cornerRadius(29, corners: [.bottomLeft, .bottomRight])
                
                Spacer()
            }
            
            VStack {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                    Spacer()
                    Text("David Miller")
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Medium", size: 16))
                    Spacer()
                    Image("iconShare")
                }
                .padding(.horizontal)
                .padding(.top, screenBounds.height/20)
                HStack(spacing: 20) {
                    BusinessCardMini(width: screenBounds.width/2.4, height: screenBounds.height/8)
//                    Spacer()
                    VStack(alignment: .center) {
                        VStack(spacing: 2)  {
                            HStack(spacing: 2) {
                                Rectangle().fill(Color.yellow.opacity(0.7))
                                    .frame(width: 24, height: 24)
                                    .cornerRadius(12, corners: [.topLeft, .topRight, .bottomLeft])
                                Rectangle().fill(Color.orange)
                                    .frame(width: 24, height: 24)
                                    .cornerRadius(12, corners: [.topLeft, .topRight, .bottomRight])
                            }
                            HStack(spacing: 2)  {
                                Rectangle().fill(Color.orange)
                                    .frame(width: 24, height: 24)
                                    .cornerRadius(12, corners: [.topLeft, .bottomLeft, .bottomRight])
                                Rectangle().fill(Color.yellow.opacity(0.7))
                                    .frame(width: 24, height: 24)
                                    .cornerRadius(12, corners: [.bottomRight, .topRight, .bottomLeft])
                            }
                        }
                        .opacity(0.8)
                        .background(RoundedRectangle(cornerRadius: 9).fill(Color.gray).frame(width: screenBounds.width/2.4, height: screenBounds.height/8))
                        .overlay(Image(systemName: "plus").foregroundColor(.white).font(.system(size: 36, weight: .bold, design: .default)))
                    }
                    .frame(width: screenBounds.width/2.4, height: screenBounds.height/8)
                }
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(items, id: \.self) { item in
                        BusinessCardDetailItem(image: item[0], title: item[1], value: item[2], menuColor: Color("CloudyWhite")) {
                            //
                        }
                    }
                }
                Spacer()
                customButton(title: "Save", backgroundColor: Color("AppGreen"), width: screenBounds.width/1.2, height: 64) {
                    //
                }
                .padding(.bottom)
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct BusinessCardMini: View {
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        VStack {
            HStack {
                VStack(spacing: 2)  {
                    HStack(spacing: 2) {
                        Rectangle().fill(Color.yellow.opacity(0.7))
                            .frame(width: 24, height: 24)
                            .cornerRadius(12, corners: [.topLeft, .topRight, .bottomLeft])
                        Rectangle().fill(Color.orange)
                            .frame(width: 24, height: 24)
                            .cornerRadius(12, corners: [.topLeft, .topRight, .bottomRight])
                    }
                    HStack(spacing: 2)  {
                        Rectangle().fill(Color.orange)
                            .frame(width: 24, height: 24)
                            .cornerRadius(12, corners: [.topLeft, .bottomLeft, .bottomRight])
                        Rectangle().fill(Color.yellow.opacity(0.7))
                            .frame(width: 24, height: 24)
                            .cornerRadius(12, corners: [.bottomRight, .topRight, .bottomLeft])
                    }
                }
                Spacer()
                VStack {
                    HStack(spacing: 0) {
                        Rectangle().fill(Color.white)
                            .frame(height: 8, alignment: .leading)
                            .opacity(0.4)
                        Button(action: {
                            
                        }) {
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .padding(.all, 2)
                                .background(RoundedRectangle(cornerRadius: 4).fill(Color("AppGreen")))
                        }
                        
                    }
                    Rectangle().fill(Color.white)
                        .frame(height: 8, alignment: .leading)
                        .opacity(0.4)
                }
            }
            .padding([.horizontal, .top])
            
            Spacer()
            HStack {
                Text("Business Card")
                    .font(.custom("Poppins-Regular", size: 11))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
        }
        .frame(width: width, height: height)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color("AppYellow")))
    }
}
