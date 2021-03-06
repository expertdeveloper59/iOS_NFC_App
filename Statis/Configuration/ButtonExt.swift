//
//  ButtonExt.swift
//  Statis
//
//  Created by Fateh Khan on 06/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import Foundation
import SwiftUI

extension String {
    func isValidPhoneNumber() -> Bool {
        let regEx = "^\\+(?:[0-9]?){6,14}[0-9]$"

        let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
        return phoneCheck.evaluate(with: self)
    }
}

extension View {
    func customButton(title: String,
                              backgroundColor: Color,
                              width: CGFloat,
                              height: CGFloat,
                              action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .modifier(ButtonModifier(font: UIConfiguration.buttonFont,
                                         color: backgroundColor,
                                         textColor: .white,
                                         width: width,
                                         height: height))
        }
    }
    
    func roundedRectCustomButton(title: String,
                              backgroundColor: UIColor,
                              width: CGFloat,
                              height: CGFloat,
                              action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .modifier(RectButtonModifier(font: UIConfiguration.buttonFont,
                                         color: backgroundColor,
                                         textColor: .white,
                                         width: width,
                                         height: height))
        }
    }
}
