//
//  AboutStatisView.swift
//  Statis
//
//  Created by Fateh Khan on 12/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct AboutStatisView: View {
    let screenBounds = UIScreen.main.bounds
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    Image("aboutHeader")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:screenBounds.width, height: (screenBounds.height/4))
                        .overlay(Color.black.opacity(0.2))
                        .padding(.top, -20)
                    AboutViewShape()
                        .fill(Color("AppLightGreen"))
                        .offset(y: -70)
                    Spacer()
                }
                VStack {
                    Spacer()
                        .frame(width:screenBounds.width, height: (screenBounds.height/4))
                    AboutViewShape()
                        .fill(Color("AppGreen").opacity(0.4))
                        .offset(y: -50)
                }
                VStack {
                    Spacer()
                        .frame(width:screenBounds.width, height: (screenBounds.height/4))
                    AboutViewShape()
                        .fill(Color("AppGreen"))
                        .offset(y: -20)
                }
            }
            VStack(alignment: .center) {
                Spacer()
                    .frame(height: screenBounds.height/5)
                Image("aboutLogo")
                    .padding()
                    .background(Circle().fill(Color.white).frame(width: screenBounds.width/3, height: screenBounds.width/3))
                    .padding(.bottom)
                HStack(spacing: screenBounds.width/8) {
                    Button(action: {
                        
                    }) {
                        Image("iconFB")
                            .padding()
                            .background(Circle().fill(Color.white))
                    }
                    Button(action: {
                        
                    }) {
                        Image("iconInsta")
                            .padding()
                            .background(Circle().fill(Color.white))
                    }
                    Button(action: {
                        
                    }) {
                        Image(systemName: "phone")
                            .foregroundColor(Color("AppGreen"))
                            .padding()
                            .background(Circle().fill(Color.white))
                    }
                }
                .padding()
                .padding(.top)
                HStack(spacing: screenBounds.width/8) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "envelope")
                            .foregroundColor(Color("AppGreen"))
                            .padding()
                            .background(Circle().fill(Color.white))
                    }
                    Button(action: {
                        
                    }) {
                        Image("iconNav")
                            .foregroundColor(Color("AppGreen"))
                            .padding()
                            .background(Circle().fill(Color.white))
                    }
                    Button(action: {
                        
                    }) {
                        Image("iconGoogle")
                            .foregroundColor(Color("AppGreen"))
                            .padding()
                            .background(Circle().fill(Color.white))
                    }
                }
                .padding()
                
                HStack {
                    Image(systemName: "person.badge.plus")
                        .foregroundColor(.white)
                    Text("Add Me To Contact List")
                        .font(.custom("Poppins-Medium", size: 17))
                        .foregroundColor(.white)
                }
                .background(customButton(title: "", backgroundColor: Color("AppGreen"), width: screenBounds.width/1.2, height: 56, action: {
                    //
                }))
                .padding(.top)
                Spacer()
            }
            VStack {
                Spacer()
                VStack {
                    Text("ABOUT US")
                        .font(.custom("Poppins-Medium", size: 17))
                        .foregroundColor(Color("BlackTanText"))
                    Divider()
                        .frame(width: 72, height: 2, alignment: .center)
                        .foregroundColor(Color("AppGreen"))
                        .background(Color("AppGreen"))
                    Text("Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.")
                        .font(.custom("Poppins-Regular", size: 16))
                        .foregroundColor(.gray)
                        .padding(.bottom)
                }
                .padding()
                .background(Color.white.frame(width: screenBounds.width))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AboutViewShape: Shape {
    let screenSize = UIScreen.main.bounds
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.minY), control1: CGPoint(x: rect.midX, y: rect.minY+60), control2: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.closeSubpath()
        
        return path
    }
}


struct AboutStatisView_Previews: PreviewProvider {
    static var previews: some View {
        AboutStatisView()
    }
}
