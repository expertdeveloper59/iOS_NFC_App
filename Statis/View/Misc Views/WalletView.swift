//
//  WalletView.swift
//  Statis
//
//  Created by Fateh Khan on 14/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct WalletView: View {
    let screenBounds = UIScreen.main.bounds
    @State private var selectedTab: Int = 0
    var body: some View {
        ZStack {
            Color("CloudyWhite")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Color("AppGreen")
                    .frame(height: screenBounds.height/8)
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color.white)
                    Spacer()
                    Text("Wallet")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .padding()
                .background(Color("AppGreen"))
                HStack {
                    Button(action: {
                        withAnimation {
                            selectedTab = 0
                        }
                    }) {
                        Text("Business Cards")
                            .font(.custom("Poppins-Regular", size: selectedTab == 0 ? 16 : 14))
                            .foregroundColor(selectedTab == 0 ? Color("AppGreen") : Color.gray.opacity(0.6))
                    }
                    Button(action: {
                        withAnimation {
                            selectedTab = 1
                        }
                    }) {
                        Text("Transit Cards")
                            .font(.custom("Poppins-Regular", size: selectedTab == 1 ? 16 : 14))
                            .foregroundColor(selectedTab == 1 ? Color("AppGreen") : Color.gray.opacity(0.6))
                    }
                    Button(action: {
                        withAnimation {
                            selectedTab = 2
                        }
                    }) {
                        Text("Rewards Cards")
                            .font(.custom("Poppins-Regular", size: selectedTab == 2 ? 16 : 14))
                            .foregroundColor(selectedTab == 2 ? Color("AppGreen") : Color.gray.opacity(0.6))
                    }
                }
                .padding()
                
                switch(selectedTab) {
                case 0: TabbedCardView()
                case 1: TabbedCardView()
                default:
                    TabbedCardView()
                }
                HStack {
                    Circle().fill(Color("AppGreen")).frame(width: 12, height: 12)
                    Circle().fill(Color("AppGreen").opacity(0.4)).frame(width: 12, height: 12)
                    Circle().fill(Color("AppGreen").opacity(0.4)).frame(width: 12, height: 12)
                }
                
                HStack {
                    Text("Payment")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color("BlackTanText"))
                        .padding()
                    Spacer()
                }
                
                VStack(spacing: 30) {
                    VStack {
                        HStack {
                            Image(systemName: "creditcard.fill")
                                .foregroundColor(.gray)
                            Text("Credit Card")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(Color("BlackTanText"))
                            Spacer()
                            Text("Choose")
                                .font(.custom("Poppins-Regular", size: 13))
                                .foregroundColor(Color.gray.opacity(0.6))
                        }
                    }
                    .padding(.top)
                    Divider()
                    VStack {
                        HStack {
                            Image(systemName: "creditcard")
                                .foregroundColor(.gray)
                            Text("Visa")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(Color("BlackTanText"))
                            Spacer()
                            Text("Choose")
                                .font(.custom("Poppins-Regular", size: 13))
                                .foregroundColor(Color.gray.opacity(0.6))
                        }
                    }
                    Divider()
                    VStack {
                        HStack {
                            Image(systemName: "creditcard.fill")
                                .foregroundColor(.gray)
                            Text("Debit Card")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(Color("BlackTanText"))
                            Spacer()
                            Text("Choose")
                                .font(.custom("Poppins-Regular", size: 13))
                                .foregroundColor(Color.gray.opacity(0.6))
                        }
                    }
                    .padding(.bottom)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                .padding()
                Spacer()
            }
        }
    }
}

struct TabbedCardView: View {
    let screenBounds = UIScreen.main.bounds
    let colorsArray = [
        Color("CardYellow"),
        Color("AppGreen"),
        Color("CardYellow"),
        Color("AppGreen"),
        Color("CardYellow"),
        Color("AppGreen"),
        Color("CardYellow"),
        Color("AppGreen"),
        Color("CardYellow")
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0...Int.random(in: 2..<5), id: \.self) { index in
                    BusinessCardOfActionsView(width: screenBounds.width/1.2, height: screenBounds.height/5, backgroundColor: colorsArray[Int.random(in: 0..<colorsArray.count)])
                }
            }
        }
        .padding()
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
