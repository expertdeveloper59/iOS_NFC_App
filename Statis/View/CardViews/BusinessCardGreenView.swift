//
//  BusinessCardGreenView.swift
//  Statis
//
//  Created by Fateh Khan on 10/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct BusinessCardGreenView: View {
    let screenBounds = UIScreen.main.bounds
    var body: some View {
        ZStack {
            Color("AppGreen").edgesIgnoringSafeArea(.all)
            VStack {
                
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color.white)
                    Spacer()
                    VStack {
                        HStack {
                            Rectangle().fill(Color.yellow.opacity(0.7))
                                .frame(width: 24, height: 24)
                                .cornerRadius(12, corners: [.topLeft, .topRight, .bottomLeft])
                            Rectangle().fill(Color.orange)
                                .frame(width: 24, height: 24)
                                .cornerRadius(12, corners: [.topLeft, .topRight, .bottomRight])
                        }
                        HStack {
                            Rectangle().fill(Color.orange)
                                .frame(width: 24, height: 24)
                                .cornerRadius(12, corners: [.topLeft, .bottomLeft, .bottomRight])
                            Rectangle().fill(Color.yellow.opacity(0.7))
                                .frame(width: 24, height: 24)
                                .cornerRadius(12, corners: [.bottomRight, .topRight, .bottomLeft])
                        }
                    }
                    .opacity(0.5)
                }
                .padding()
                
                Spacer()
                
                BusinessCard(width: screenBounds.width/1.4, height: screenBounds.height/6) {
                    
                }
                Spacer()
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.white)
                    .frame(width: screenBounds.width/6, height: screenBounds.width/6)
                    .overlay(RoundedRectangle(cornerRadius: 14).fill(Color("AppGreen")).frame(width: screenBounds.width/6.4, height: screenBounds.width/6.4))
                    .overlay(RoundedRectangle(cornerRadius: 14).fill(Color.white).frame(width: screenBounds.width/9, height: screenBounds.width/9))
            }
        }
    }
}

struct BusinessCardGreenView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCardGreenView()
    }
}
