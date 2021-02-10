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
                HStack {
                    Image(systemName: "chevron.left")
                    Spacer()
                }
                .foregroundColor(Color.white)
                .padding()
                
                BusinessCard(width: screenBounds.width/1.2, height: screenBounds.height/5)
                
                VStack {
                    Text("General Info")
                        .font(.custom("Poppins-Medium", size: 20))
                        .foregroundColor(.white)
                    
                }
                Spacer()
            }
        }
    }
}


struct GeneralMenuItem: View {
    let screenBounds = UIScreen.main.bounds
    var body: some View {
        HStack {
            Image(systemName: "home")
                .background(Circle().fill(Color.white))
        }
    }
}

struct GeneralCardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralCardInfoView()
    }
}
