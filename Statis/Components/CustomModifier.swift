//
//  CustomModifier.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import SwiftUI

struct TextModifier: ViewModifier {
    private let font: UIFont
    private let color: UIColor
    
    init(font: UIFont, color: UIColor = .black) {
        self.font = font
        self.color = color
    }
    func body(content: Content) -> some View {
        content
            .fixedSize(horizontal: false, vertical: true)
            .font(.custom(font.fontName, size: font.pointSize))
            .foregroundColor(Color(color))
            .multilineTextAlignment(.center)
            .lineLimit(nil)
    }
}

struct ShadowModifier: ViewModifier {
    let color: UIColor
    func body(content: Content) -> some View {
        content
            .shadow(color: Color(color), radius: 5.0, x: 3, y: 3)
    }
}

struct ButtonModifier: ViewModifier {
    private let font: UIFont
    private let color: UIColor
    private let textColor: UIColor
    private let width: CGFloat?
    private let height: CGFloat?
    
    init(font: UIFont,
         color: UIColor,
         textColor: UIColor = .white,
         width: CGFloat? = nil,
         height: CGFloat? = nil) {
        self.font = font
        self.color = color
        self.textColor = textColor
        self.width = width
        self.height = height
    }
    
    func body(content: Content) -> some View {
        content
            .modifier(TextModifier(font: font,
                                   color: textColor))
            .padding()
            .frame(width: width, height: height)
            .background(
                Capsule(style: .circular)
                    .fill(Color("AppGreen"))
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 8)
            )
            .overlay(RoundedRectangle(cornerRadius: .infinity)
                        .stroke(Color.white, lineWidth: 4))
    }
}

struct MyTextFieldStyle: TextFieldStyle {
    var screenSize = UIScreen.main.bounds
    let imageName: String
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 16)
            .padding(.leading, screenSize.width/6)
            .background(
                ZStack {
                    Capsule().fill(Color.white)
                    HStack {
                        RoundedRectangle(cornerRadius: .infinity,
                                         style: .continuous)
                            .stroke(Color.white, lineWidth: 1)
                    }
                    HStack {
                        VStack {
                            Image(systemName: imageName)
                                .foregroundColor(.white)
                                .padding(14)
                        }
                        .background(Color("AppGreen"))
                        .clipShape(Circle())
                        .padding(.leading, 4)
                        Spacer()
                    }
                }
            )
    }
}
