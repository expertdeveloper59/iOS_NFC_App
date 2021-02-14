//
//  StatisProfile.swift
//  Statis
//
//  Created by Fateh Khan on 12/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct StatisProfile: View {
    let items = [
        ["user", "Full Name", "Alexndar Jole"],
        ["iconPhone", "Phone", "+9293334040"],
        ["iconMail", "Email Address", "email@inofr.com"],
        ["iconBuilding", "Company", "Redf Inc."],
        ["iconBuilding", "Job Title", "Awsm"]
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Image("aboutLogo")
            
            HStack(alignment: .top) {
                VStack {
                    Image("profilePhoto")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
                VStack(alignment: .leading, spacing: 4) {
                    
                    Image(systemName: "person")
                        .font(.system(size: 18, weight: .light, design: .default))
                        .foregroundColor(Color.white)
                    
                    Image("iconBriefcase")
                        .foregroundColor(Color.white)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Jason Holder")
                        .font(.custom("Poppins-SemiBold", size: 16))
                        .foregroundColor(Color.white)
                    
                    Text("Managing Director, Chirp")
                        .font(.custom("Poppins-Regular", size: 13))
                        .foregroundColor(Color.white)
                    
                    Button(action: {
                        //
                    }) {
                        Text("Add to contact list")
                            .font(.custom("Poppins-Medium", size: 10))
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .foregroundColor(Color("AppGreen"))
                            .background(RoundedRectangle(cornerRadius: 4).fill(Color.white).shadow(color: .gray, radius: 2, x: 0, y: 2))
                    }
                }
                
                Spacer()
            }
            .padding(.all, 12)
            .padding(.vertical, 6)
            .background(RoundedRectangle(cornerRadius: 14).fill(Color("AppGreen")))
            .padding()
            
            
            HStack {
                Text("Contact Me")
                    .font(.custom("Poppins-Medium", size: 15))
                    .foregroundColor(Color("BlackTanText"))
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(items, id: \.self) { item in
                    BusinessCardDetailItem(image: item[0], title: item[1], value: item[2], menuColor: Color("CloudyWhite"), showAdd: false) {
                        //
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text("CONNECT WITH ME")
                    .font(.custom("Poppins-Medium", size: 15))
                    .foregroundColor(Color("BlackTanText"))
                HStack {
                    Button(action: {
                        
                    }) {
                        Image("iconFBW")
                            .padding()
                            .foregroundColor(.white)
                            .background(Circle().fill(Color.blue))
                    }
                    Button(action: {
                        
                    }) {
                        Image("iconTwitter")
                            .padding()
                            .foregroundColor(.white)
                            .background(Circle().fill(Color.blue.opacity(0.8)))
                    }
                    Button(action: {
                        
                    }) {
                        Image("iconGoogleW")
                            .padding()
                            .foregroundColor(.white)
                            .background(Circle().fill(Color.red))
                    }
                    Spacer()
                }
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("PAY ME")
                    .font(.custom("Poppins-Medium", size: 15))
                    .foregroundColor(Color("BlackTanText"))
                
                Button(action: {
                    
                }) {
                    HStack {
                        Image("mastercard")
                        Text("Mastercard")
                            .font(.custom("Poppins-Regular", size: 13))
                            .foregroundColor(Color.gray)
                        Spacer()
                    }
                }
                
                Divider()
                Button(action: {
                    
                }) {
                    HStack {
                        Image("paypal")
                        Text("PayPal")
                            .font(.custom("Poppins-Regular", size: 13))
                            .foregroundColor(Color.gray)
                        Spacer()
                    }
                }
                
            }
            .padding()
        }
    }
}

struct StatisProfile_Previews: PreviewProvider {
    static var previews: some View {
        StatisProfile()
    }
}
