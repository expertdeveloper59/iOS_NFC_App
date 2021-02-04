//
//  CustomTextField.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    private let isPasswordType: Bool
    private let placeHolderText: String
    private let sfSymbolName: String
    private let keyboardType: UIKeyboardType
    
    init(placeHolderText: String, text: Binding<String>, isPasswordType: Bool = false, symbolName: String = "xmark", keyboardType: UIKeyboardType = .default) {
        _text = text
        self.isPasswordType = isPasswordType
        self.placeHolderText = placeHolderText
        self.sfSymbolName = symbolName
        self.keyboardType = keyboardType
    }
    var body: some View {
        VStack {
            if isPasswordType {
                SecureField(placeHolderText, text: $text)
                    .textFieldStyle(MyTextFieldStyle( imageName: sfSymbolName))
                
            } else {
                TextField(placeHolderText, text: $text)
                    .keyboardType(keyboardType)
                    .textFieldStyle(MyTextFieldStyle(imageName: sfSymbolName))
            }
        }
    }
}

struct TextInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeHolderText: "Hi Fateh", text: .constant(""))
    }
}
