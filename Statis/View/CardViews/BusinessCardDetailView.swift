//
//  BusinessCardDetailView.swift
//  Statis
//
//  Created by Fateh Khan on 10/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct BusinessCardDetailView: View {
    let screenBounds = UIScreen.main.bounds
    let items = [
        ["user", "Full Name", "Alexndar Jole"],
        ["iconPhone", "Phone", "+9293334040"],
        ["iconBriefcase", "Work", "Al Street 23 Main"],
        ["iconMail", "Email Address", "email@inofr.com"],
        ["iconBuilding", "Company", "Redf Inc."],
        ["iconGlobe", "Website", "www.tree.com"],
        ["iconLocation", "Address", "5G Prince Building"]
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
                BusinessCard(width: screenBounds.width/1.2, height: screenBounds.height/6)
                    .padding(.top, screenBounds.height/10)
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(items, id: \.self) { item in
                        BusinessCardDetailItem(image: item[0], title: item[1], value: item[2], menuColor: Color("CloudyWhite")) {
                            //
                        }
                    }
                }
                Spacer()
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct BusinessCardDetailItem: View {
    var image = ""
    var title = ""
    var value = ""
    let screenBounds = UIScreen.main.bounds
    let menuColor: Color
    var showAdd = true
    var action: () -> ()
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 10) {
                    Image(image)
                        .foregroundColor(Color.gray)
                        .font(Font.title.weight(.thin))
                        .frame(width: 30, height: 30, alignment: .center)
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 1, height: 30)
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.custom("Poppins-Regular", size: 11))
                            .foregroundColor(Color("BlackTanText").opacity(0.5))
                        Text(value)
                            .font(.custom("Poppins-Medium", size: 13))
                            .foregroundColor(Color("BlackTanText"))
                    }
                    Spacer()
                    if showAdd {
                        Image(systemName: "plus")
                            .foregroundColor(.gray)
                            .padding(8)
                    }
                    
                }
                .padding()
            }
            .background(RoundedRectangle(cornerRadius: 8).fill(menuColor))
            .padding(.horizontal)
            .padding(.top, 2)
        }
    }
}

struct BusinessCardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCardDetailView()
    }
}
