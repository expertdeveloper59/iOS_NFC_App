//
//  CardDetailView.swift
//  Statis
//
//  Created by Fateh Khan on 10/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct CardDetailView: View {
    let screenBouns = UIScreen.main.bounds
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                Spacer()
                Text("Card")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(Color("CardQuesColor"))
                Spacer()
                EmptyView()
            }
            .padding(.horizontal)
            HStack {
                Button(action: {
                    
                }) {
                    Text("SAVE")
                        .font(.custom("Poppins-Medium", size: 15))
                        .foregroundColor(Color("CardQuesColor"))
                }
                
                Spacer()
                
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 1, height: 30)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("CANCEL")
                        .font(.custom("Poppins-Medium", size: 15))
                        .foregroundColor(Color("CardQuesColor"))
                }
                
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 14).fill(Color("CloudyWhite")))
            .padding()
            BusinessCard(width: screenBouns.width/1.2, height: screenBouns.height/5) {
                
            }
            VStack {
                HomeMenuItem(image: "pencil.and.ellipsis.rectangle", title: "Edit Info", menuColor: Color("CloudyWhite")) {
                    //
                }
                HomeMenuItem(image: "square.and.pencil", title: "Modify", menuColor: Color("CloudyWhite")) {
                    //
                }
                HomeMenuItem(image: "pencil", title: "Write", menuColor: Color("CloudyWhite")) {
                    //
                }
            }
            VStack {
                Spacer()
                customButton(title: "Delete Card", backgroundColor: .red, width: screenBouns.width/1.2, height: 64) {
                    //
                }
            }
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView()
    }
}
