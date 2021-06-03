//
//  GeneralCardInfoView.swift
//  Statis
//
//  Created by Fateh Khan on 10/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct GeneralCardInfoView: View {
    let screenBounds = UIScreen.main.bounds
    var body: some View {
        ZStack {
            Color("AppGreen").edgesIgnoringSafeArea(.all)
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Image("headerPath")
                }
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HalfCircle()
            }
            .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Image(systemName: "chevron.left")
                    Spacer()
                }
                .foregroundColor(Color.white)
                .padding()
                
                BusinessCard(width: screenBounds.width/1.2, height: screenBounds.height/5) {
                    
                }
                
                VStack {
                    HStack {
                        Text("General Info")
                            .font(.custom("Poppins-Medium", size: 20))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    
                    GeneralMenuItem(image: "person", title: "Full Name", value: "David Gibs")
                        .padding(.horizontal)
                    
                    GeneralMenuItem(image: "envelope", title: "Email Address", value: "dav@fds.com")
                        .padding(.horizontal)
                    
                    GeneralMenuItem(image: "phone", title: "Phone", value: "+23232389794")
                        .padding(.horizontal)
                    
                    GeneralMenuItem(image: "house", title: "Company", value: "David Inc Gibs")
                        .padding(.horizontal)
                    
                    GeneralMenuItem(image: "house", title: "Job Title", value: "Manager")
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("DONE")
                            .font(.custom("Poppins-Medium", size: 23))
                            .foregroundColor(Color("AppGreen"))
                    }
                    
                }
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}


struct GeneralMenuItem: View {
    let screenBounds = UIScreen.main.bounds
    let image: String
    let title: String
    let value: String
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.system(size: 16, weight: .light, design: .default))
                .foregroundColor(Color("AppGreen"))
                .padding()
                .background(Circle().fill(Color.white))
                .padding([.bottom, .trailing])
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.custom("Poppins-Regular", size: 12))
                    .foregroundColor(.white)
                Text(value)
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.white)
                Divider()
                    .background(Color.white)
            }
        }
    }
}

struct GeneralCardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralCardInfoView()
    }
}
