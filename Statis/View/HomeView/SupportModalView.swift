//
//  SupportModalView.swift
//  Statis
//
//  Created by Fateh Khan on 10/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct SupportModalView: View {
    let screenBounds = UIScreen.main.bounds
    let contentArray = [
        ["support1", "Reference site about Lorem Ipsum, giving information on its origins, as Reference site about Lorem Ipsum, giving"],
        ["support1", " giving information on its origins, as Reference si  giving information on its origins, as Reference siference site about Lor"],
        ["support1", "nce si  giving information o nce si  giving information o nce si  giving information o nce si  giving information o"]
    ]
    @State var currentCard = 0
//    let detectDirectionalDrags =
        
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: screenBounds.height/10)
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.gray.opacity(0.6))
                            .padding()
                            .background(Circle().fill(Color.white))
                    }
                }
                .padding(.horizontal)
                VStack {
                    Text("Support Help")
                        .font(.custom("Poppins-SemiBold", size: 21))
                        .foregroundColor(Color.black)
                        .padding(.vertical)
                        .padding(.top)
                    Image(contentArray[currentCard][0])
                        .padding(.top)
                    Text(contentArray[currentCard][1])
                        .lineSpacing(14)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(Color("BlackTanText"))
                        .padding()
                    HStack {
                        Spacer()
                        Circle().fill(Color("AppGreen")).frame(width: 12, height: 12).opacity(currentCard == 0 ? 1.0 : 0.5)
                        Circle().fill(Color("AppGreen")).frame(width: 12, height: 12).opacity(currentCard == 1 ? 1.0 : 0.5)
                        Circle().fill(Color("AppGreen")).frame(width: 12, height: 12).opacity(currentCard == 2 ? 1.0 : 0.5)
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.bottom, screenBounds.height/12)
                }
                .background(RoundedRectangle(cornerRadius: 18).fill(Color.white))
                .padding(.horizontal)
                .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                            .onEnded { value in
                                if value.translation.width < 0 && value.translation.height > -30 && value.translation.height < 30 {
                                    print("Left")
                                    withAnimation {
                                        if currentCard > 0 {
                                           currentCard -= 1
                                        }
                                    }
                                }
                                else if value.translation.width > 0 && value.translation.height > -30 && value.translation.height < 30 {
                                    print("Right")
                                    if currentCard < contentArray.count {
                                       currentCard += 1
                                    }
                                }
                            })
                Spacer()
            }
            .background(Color.gray.opacity(0.6).edgesIgnoringSafeArea(.all))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

