//
//  FloatingTextField.swift
//  Statis
//
//  Created by Fateh Khan on 06/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct CustomFieldText: View {
@Binding var name: String
var label: String
var required: Bool = true
var indicator: Bool = true
@State private var onKeyIn = false

var body: some View {
    ZStack {
        VStack(alignment: .leading) {
            HStack {
                Text(label)
                if required {
                    Text("*")
                }
                Spacer()
            }
            .multilineTextAlignment(.leading)
            .font(.custom("Poppins-Regular", size: self.onKeyIn || self.name != "" ? 14 : 18))
            .offset(y: self.onKeyIn || self.name != "" ? -30 : 0)
            .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0))
            .foregroundColor(.gray)
            
            Rectangle().frame(height: 2)
                .cornerRadius(10)
                .foregroundColor(Color(#colorLiteral(red: 0.8392156863, green: 0.8784313725, blue: 0.8784313725, alpha: 1)))
        }
        VStack {
            TextField(self.name, text: self.$name)
                .font(.custom("Poppins-Regular", size: 18))
                .autocapitalization(.none)
                .textContentType(.nickname)
                .foregroundColor(.black)
                .padding(.bottom, 30)
                .padding(.top, 5)
                .onTapGesture {
                    self.onKeyIn = true
                }
            .zIndex(1)
        }
        
        VStack {
//            if self.name.count = 0 {
                HStack {
                    Spacer()
                    Image(systemName: "checkmark")
                        .frame(width: 20, height: 20)
                        .padding(.all, 2)
                        .background(Color("AppGreen"))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .padding(.leading, 4)
                }
//            }
        }
    }
}}
