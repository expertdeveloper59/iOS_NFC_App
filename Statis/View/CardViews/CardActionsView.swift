//
//  CardActionsView.swift
//  Statis
//
//  Created by Fateh Khan on 14/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct CardActionsView: View {
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
                Spacer().frame(height: screenBounds.height/12)
                BusinessCardOfActionsView(width: screenBounds.width/1.2, height: screenBounds.height/5, backgroundColor: Color("CardYellow"))
                    .padding(.top)
                
                HStack(spacing: screenBounds.width/6) {
                    ActionButton(image: "envelope.fill") {
                        //
                    }
                    ActionButton(image: "phone.fill") {
                        //
                    }
                    ActionButton(image: "paperclip") {
                        //
                    }
                }
                .padding()
                
                HStack(spacing: screenBounds.width/6) {
                    ActionButton(image: "trash.fill") {
                        //
                    }
                    ActionButton(image: "bookmark.fill") {
                        //
                    }
                    ActionButton(image: "person.crop.square") {
                        //
                    }
                }
                .padding()
                
                Spacer()
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BusinessCardOfActionsView: View {
    let width: CGFloat
    let height: CGFloat
    let backgroundColor: Color
    var body: some View {
        VStack {
            HStack {
                VStack(spacing: 4) {
                    HStack(spacing: 4) {
                        Rectangle().fill(Color.yellow.opacity(0.9))
                            .frame(width: 30, height: 30)
                            .cornerRadius(10, corners: [.topLeft, .topRight, .bottomLeft])
                        Rectangle().fill(Color("AppOrange"))
                            .frame(width: 30, height: 30)
                            .cornerRadius(10, corners: [.topLeft, .topRight, .bottomRight])
                    }
                    HStack(spacing: 4) {
                        Rectangle().fill(Color("AppOrange"))
                            .frame(width: 30, height: 30)
                            .cornerRadius(10, corners: [.topLeft, .bottomLeft, .bottomRight])
                        Rectangle().fill(Color.yellow.opacity(0.9))
                            .frame(width: 30, height: 30)
                            .cornerRadius(10, corners: [.bottomRight, .topRight, .bottomLeft])
                    }
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Alex Smith")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.white)
                    Text("Info@gmail.com")
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(.white)
                        .opacity(0.77)
                    Text("+1234567890")
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(.white)
                        .opacity(0.77)
                    Text("SN. Advocate")
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(.white)
                        .opacity(0.77)
                }
            }
            .padding([.horizontal, .top])
            
            Spacer()
            HStack {
                Text("Business Card")
                    .font(.custom("Poppins-Regular", size: 15))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
        }
        .frame(width: width, height: height)
        .background(RoundedRectangle(cornerRadius: 14).fill(backgroundColor))
    }
}

struct ActionButton: View {
    let image: String
    let action: () -> ()
    var body: some View {
        Button(action: action) {
           Image(systemName: image)
            .foregroundColor(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).fill(Color("AppGreen")))
        }
    }
}

struct CardActionsView_Previews: PreviewProvider {
    static var previews: some View {
        CardActionsView()
    }
}
