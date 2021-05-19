//
//  HomeView.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var isDrawerOpen: Bool = false
    @ObservedObject var state: AppState
    let screenBounds = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack {
                        Button(action: {
                            self.isDrawerOpen.toggle()
                        }) {
                            Image("left_bar")
                        }
                        .padding(.horizontal)
                        SearchTextField()
                    }
                    .padding(.horizontal)
                    Text("Home")
                        .font(.custom("Poppings-SemiBold", size: 18))
                        .foregroundColor(Color("AppGreen"))
                        .padding(.bottom)
                }
                .padding(.top)
                .background(Color.white)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        HStack {
                            Button(action: {
                                
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(Color("BlackTanText"))
                                    .font(Font.title.weight(.bold)).padding().background(RoundedRectangle(cornerRadius: 14).stroke(Color.gray, lineWidth: 1))
                            }
                        }
                        
                        ForEach(1...4, id: \.self) { index in
                            BusinessCard(width: screenBounds.width/1.4, height: screenBounds.height/4)
                                .onTapGesture {
                                    print("Card Number \(index+1) is tapped")
                                }
                        }
                    }
                }
                
                VStack {
                    HomeMenuItem(image: "creditcard", title: "Wallet", menuColor: Color.white) {
                        print("Menu Item Tapped")
                    }
                    HomeMenuItem(image: "person.crop.square", title: "Contacts", menuColor: Color.white) {
                        print("Menu Item Tapped")
                    }
                    HomeMenuItem(image: "person", title: "Profile", menuColor: Color.white) {
                        print("Menu Item Tapped")
                    }
                    HomeMenuItem(image: "gear", title: "Settings", menuColor: Color.white) {
                        print("Menu Item Tapped")
                    }
                }
                Spacer()
//                QrCodeButton(title: "Scan") {
//                    print("Scan Tapped")
//                }
//                .padding(.top)
                Spacer()
                BottomButtons()
            }.background(Color("CloudyWhite").edgesIgnoringSafeArea(.all))
            
            DrawerView(isOpen: self.$isDrawerOpen, state: self.state)
            
//            FilterModalView(title: .constant(""), batch: .constant(""), management: .constant(""))
            //SupportModalView()
        }.background(Color("CloudyWhite").edgesIgnoringSafeArea(.all))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct SearchTextField: View {
    @State var text = ""
    var body: some View {
        VStack {
            VStack {
                HStack {
                    TextField("Search by username", text: self.$text, onCommit: {
                        print("Searched for \(self.text)")
                      })
                        .font(.custom("Poppins-Regular", size: 18))
                        .frame(height: 55)
                    .padding(.leading)
                    Button(action: {
                        print("Searched for \(self.text)")
                    }) {
                        VStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                                .padding(8)
                        }
                        .background(Color("AppGreen"))
                        .clipShape(Circle())
                        .padding(.leading, 4)
                    }
                }
                .background(RoundedRectangle(cornerRadius: 7).fill(Color("CloudyWhite")))
//                TextField("Search by username", text: self.$text, onCommit: {
//                    print("Searched for \(self.text)")
//                  })
//                    .font(.custom("Poppins-Regular", size: 18))
//                    .frame(height: 55)
//                    .overlay(ZStack {
//                        RoundedRectangle(cornerRadius: 7).fill(Color("CloudyWhite"))
//                        HStack {
//                            Spacer()
//                            Button(action: {
//                                print("Searched for \(self.text)")
//                            }) {
//                                VStack {
//                                    Image(systemName: "magnifyingglass")
//                                        .foregroundColor(.white)
//                                        .padding(8)
//                                }
//                                .background(Color("AppGreen"))
//                                .clipShape(Circle())
//                                .padding(.leading, 4)
//                            }
//                        }
//                    })
            }
        }
    }
}

struct BusinessCard: View {
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Rectangle().fill(Color.yellow.opacity(0.7))
                            .frame(width: 30, height: 30)
                            .cornerRadius(8, corners: [.topLeft, .topRight, .bottomLeft])
                        Rectangle().fill(Color.orange)
                            .frame(width: 30, height: 30)
                            .cornerRadius(8, corners: [.topLeft, .topRight, .bottomRight])
                    }
                    HStack {
                        Rectangle().fill(Color.orange)
                            .frame(width: 30, height: 30)
                            .cornerRadius(8, corners: [.topLeft, .bottomLeft, .bottomRight])
                        Rectangle().fill(Color.yellow.opacity(0.7))
                            .frame(width: 30, height: 30)
                            .cornerRadius(8, corners: [.bottomRight, .topRight, .bottomLeft])
                    }
                }
                Spacer()
                VStack {
                    Text("Name of Owner")
                        .font(.custom("Poppins-Regular", size: 18))
                        .foregroundColor(.white)
                    Text("More Details")
                        .font(.custom("Poppins-Regular", size: 16))
                        .foregroundColor(.gray)
                }
//                Image("text_placeholder")
//                    .resizable()
//                    .frame(width: 92, height: 44)
            }
            .padding([.horizontal, .top])
            
            Spacer()
            HStack {
                Text("Business Card")
                    .font(.custom("Poppins-Regular", size: 15))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
        }
        .frame(width: width, height: height)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color("AppOrange")))
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct HomeMenuItem: View {
    var image = ""
    var title = ""
    let screenBounds = UIScreen.main.bounds
    let menuColor: Color
    var action: () -> ()
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 10) {
                    Image(systemName: image)
                        .foregroundColor(Color.gray)
                        .font(Font.title.weight(.thin))
                        .frame(width: 30, height: 30, alignment: .center)
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 1, height: 30)
                    Text(title)
                        .font(.custom("Poppins-Medium", size: 15))
                        .foregroundColor(Color("BlackTanText"))
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color("AppGreen"))
                    }
                    .clipShape(Circle())
                    .background(Circle().fill(Color("AppGreen")).opacity(0.3).frame(width: 48, height: 48))
                    .padding(.leading, 4)
                    
                }
                .padding()
            }
            .background(RoundedRectangle(cornerRadius: 8).fill(menuColor))
            .padding([.top, .horizontal])
        }
        .onTapGesture {
            action()
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct QrCodeButton: View {
    var title = ""
    let screenBounds = UIScreen.main.bounds
    var action: () -> ()
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 20) {
                Image("qrCode")
                    .foregroundColor(Color.gray)
                    .font(Font.title.weight(.thin))
                    .frame(width: 30, height: 30, alignment: .center)
                Text(title)
                    .font(.custom("Poppins-Medium", size: 15))
                    .foregroundColor(Color.white)
                
            }
            .padding()
            .padding(.horizontal)
            .background(RoundedRectangle(cornerRadius: 11).fill(Color("AppGreen")))
        }
    }
}

struct BottomButtons: View {
    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                print("Read Tapped")
            }) {
                Image(systemName: "arrow.down.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
            }
            Spacer()
            QrCodeButton(title: "Scan") {
                print("Scan Tapped")
            }
            .padding(.top)
            Spacer()
            Button(action: {
                print("Write Tapped")
            }) {
                Image(systemName: "arrow.up.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal)
    }
    
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

