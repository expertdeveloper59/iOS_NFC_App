//
//  ContactsView.swift
//  Statis
//
//  Created by Fateh Khan on 10/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct ContactsView: View {
    let screenBouns = UIScreen.main.bounds
    let persons = ["Alex Smith", "James Faulkner", "David Warner", "Garchel Fibs", "Rock Anersto", "Fernando Alef"]
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(Color.white)
                Text("Contacts")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(Color.white)
                Spacer()
                Button (action: {
                    //
                }) {
                    Text("SCAN")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color("AppOrange")))
                }
            }
            .padding()
            .background(Color("AppGreen"))
            
            Spacer()
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(persons, id: \.self) { name in
                    ContactItem(personName: name)
                        .padding()
                }
            }
        }
    }
}

struct ContactItem: View {
    let screenBouns = UIScreen.main.bounds
    let personName: String
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("CloudyWhite"))
                    .frame(width: screenBouns.width/1.2, height: 96)
                    .padding(.leading)
            }
            HStack(spacing: 20) {
                Image("profilePhoto")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(width: 72, height: 72)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.all, 2)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                Text(personName)
                    .font(.custom("Poppins-Medium", size: 15))
                    .foregroundColor(Color("BlackTanText"))
                
                Spacer()
            }
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
