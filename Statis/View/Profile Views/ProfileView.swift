//
//  ProfileView.swift
//  Statis
//
//  Created by Fateh Khan on 11/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    let screenBounds = UIScreen.main.bounds
    @State var isAboutActive = true
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "bell")
                        .foregroundColor(.white)
                    Image(systemName: "gear")
                        .foregroundColor(.white)
                }
                .padding()
                VStack(alignment: .center) {
                    ZStack {
                        Image("profilePhoto")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: screenBounds.width/3.6, height: screenBounds.width/3.6)
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Image(systemName: "camera.fill")
                                    .foregroundColor(Color.white)
                                    .padding(.all, 8)
                                    .background(Circle().fill(Color.white).overlay(Circle().fill(Color("AppGreen")).padding(.all, 2)))
                                    .offset(x: 16)
                            }
                        }
                        .padding([.bottom])
                    }
                    .frame(width: screenBounds.width/3.6, height: screenBounds.width/3.6, alignment: .center)
                    Text("David Remal")
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(Color.white)
                    Text("Managing Director, states")
                        .font(.custom("Poppins-Regular", size: 11))
                        .foregroundColor(Color.gray.opacity(0.8))
                        .lineLimit(1)
                    HStack {
                        HStack {
                            Text("230")
                                .font(.custom("Poppins-Medium", size: 17))
                                .foregroundColor(Color.white)
                            Text("Friends")
                                .font(.custom("Poppins-Regular", size: 13))
                                .foregroundColor(Color.gray.opacity(0.8))
                        }
                        
                        VStack(spacing: -20) {
                            ForEach(1...5, id: \.self) { index in
                                Text(".")
                                    .font(.custom("Poppins-SemiBold", size: 18))
                                    .foregroundColor(Color.gray.opacity(0.8))
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("006")
                                .font(.custom("Poppins-Medium", size: 17))
                                .foregroundColor(Color.white)
                            Text("Network")
                                .font(.custom("Poppins-Regular", size: 13))
                                .foregroundColor(Color.gray.opacity(0.8))
                        }
                    }
                    
                    HStack {
                        Circle().fill(Color.white).frame(width: 12, height: 12)
                        Circle().fill(Color("AppGreen")).frame(width: 12, height: 12)
                    }
                    .padding(.bottom)
                }
            }
            .background(Color("BlackTanText"))
            VStack(spacing: 0) {
                HStack {
                    Rectangle().fill(isAboutActive ? Color.white : Color("AppGreen")).frame(height: 4)
                    Rectangle().fill(isAboutActive ? Color("AppGreen") : Color.white).frame(height: 4)
                }
                HStack {
                    HStack {
                        Spacer()
                        Text("NEWSFEED")
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(isAboutActive ? .gray : Color("AppGreen"))
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Text("ABOUT")
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(isAboutActive ? Color("AppGreen") : .gray)
                        Spacer()
                    }
                    
                }
                .padding(.vertical)
            }
            VStack {
                if isAboutActive {
                    AboutTabView()
                } else {
                    NewsfeedTabView()
                }
            }
            .gesture(
                DragGesture()
                    .onChanged {
                        if $0.startLocation.x > $0.location.x {
                            isAboutActive =  false
                        } else if $0.startLocation.x == $0.location.x {
                            //
                        } else {
                            isAboutActive = true
                        }
                    })
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct NewsfeedTabView: View {
    let screenBounds = UIScreen.main.bounds
    var body: some View {
        VStack {
            ZStack {
                Image("feedImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: screenBounds.height/4)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack {
                    HStack {
                        Text("HARVID DWKDW")
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(.white)
                        Spacer()
                        HStack {
                            Circle().fill(Color("AppGreen")).frame(width: 8, height: 8)
                            Spacer().frame(width: 16)
                            Text("LIVE")
                                .font(.custom("Poppins-Medium", size: 11))
                                .foregroundColor(Color("AppGreen"))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.black).opacity(0.5))
                    }
                    .padding()
                    Spacer()
                }
            }.frame(height: screenBounds.height/4)
            
            NewsfeedItem()
                .padding()
            
            NewsfeedItem()
                .padding()
            
            Spacer()
        }
        
    }
}

struct NewsfeedItem: View {
    let screenBounds = UIScreen.main.bounds
    var body: some View {
        HStack {
            VStack {
                Image("profilePhoto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            VStack {
                HStack {
                    Text("David Miller")
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundColor(Color("BlackTanText"))
                    Spacer()
                    Text("23m ago")
                        .font(.custom("Poppins-Medium", size: 13))
                        .foregroundColor(Color("BlackTanText").opacity(0.8))
                }
                Text("Welcome to my feed, where I am able to share with you special related to my brand!")
                    .font(.custom("Poppins-Regular", size: 13))
                    .foregroundColor(Color("BlackTanText").opacity(0.8))
            }
            
        }
    }
}

struct AboutTabView: View {
    let screenBounds = UIScreen.main.bounds
    let items = [
        ["phone", "Phone", "+0239023892"],
        ["envelope", "Email Address", "Info@gmail.com"],
        ["house", "Address", "#123, saini enclave , Norway"],
        ["house", "Location", "Norway"]
        
    ]
    var body: some View {
        VStack {
            HStack {
                Text("About")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(Color("BlackTanText"))
                    .padding(.leading)
                Spacer()
            }
            .padding(.leading)
            ForEach(items, id: \.self) { item in
                AboutMenuItem(image: item[0], title: item[1], value: item[2])
                    .padding()
            }
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "arrowshape.turn.up.right.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().fill(Color("AppGreen")))
                    .shadow(color: .gray, radius: 5, x: 0, y: 2)
            }
            .padding()
        }
    }
}


struct AboutMenuItem: View {
    let screenBounds = UIScreen.main.bounds
    let image: String
    let title: String
    let value: String
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: image)
                .foregroundColor(.white)
                .padding()
                .background(Circle().fill(Color("AppGreen")))
                .shadow(color: .gray, radius: 5, x: 0, y: 2)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.custom("Poppins-Regular", size: 12))
                    .foregroundColor(Color.gray.opacity(0.8))
                Text(value)
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(Color("BlackTanText"))
            }
            Spacer()
        }
    }
}

struct DottedLine: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        return path
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
