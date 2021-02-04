//
//  PasscodeField.swift
//  Statis
//
//  Created by Fateh Khan on 01/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI
import UIKit

struct PasscodeField: View {
    @State private var numberOfCells: Int = 3
    @State private var currentlySelectedCell = 0
    @Binding var originalText: String

    var body: some View {
        HStack {
            ForEach(0 ..< self.numberOfCells) { index in
                CharacterInputCell(currentlySelectedCell: self.$currentlySelectedCell, originalText: $originalText, index: index)
            }
        }
    }
}

struct CharacterInputCell: View {
    @State private var textValue: String = ""
    @Binding var currentlySelectedCell: Int
    @Binding var originalText: String
    
    var textFieldWidth = UIScreen.main.bounds.width/5
    var index: Int

    var responder: Bool {
        return index == currentlySelectedCell
    }

    var body: some View {
        PCCustomTextField(text: $textValue, currentlySelectedCell: $currentlySelectedCell, originalText: $originalText, isFirstResponder: responder)
            .frame(height: 20)
            .keyboardType(.numberPad)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding([.trailing, .leading], 10)
            .foregroundColor(Color.white)
            .padding([.vertical], 15)
            .lineLimit(1)
            .multilineTextAlignment(.center)
            .background(Rectangle().fill(Color("AppLightGreen")).frame(width: textFieldWidth, height: textFieldWidth))
    }
}


struct PCCustomTextField: UIViewRepresentable {

    class Coordinator: NSObject, UITextFieldDelegate {

        @Binding var text: String
        @Binding var currentlySelectedCell: Int
        @Binding var originalText: String

        var didBecomeFirstResponder = false

        init(text: Binding<String>, currentlySelectedCell: Binding<Int>, originalText: Binding<String>) {
            _text = text
            _currentlySelectedCell = currentlySelectedCell
            _originalText = originalText
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.text = textField.text ?? ""
                if let textValue = textField.text, textValue.count == 2 {
                    self.originalText += textValue
                }
            }
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            textField.textColor = .white
            textField.font = .systemFont(ofSize: 22)
            let currentText = textField.text ?? ""

            guard let stringRange = Range(range, in: currentText) else { return false }

            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

            if updatedText.count == 2 {
                self.currentlySelectedCell += 1
            }
//            print(updatedText)

            return updatedText.count <= 2
        }
    }

    @Binding var text: String
    @Binding var currentlySelectedCell: Int
    @Binding var originalText: String
    var isFirstResponder: Bool = false

    func makeUIView(context: UIViewRepresentableContext<PCCustomTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        return textField
    }

    func makeCoordinator() -> PCCustomTextField.Coordinator {
        return Coordinator(text: $text, currentlySelectedCell: $currentlySelectedCell, originalText: $originalText)
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<PCCustomTextField>) {
        uiView.text = text
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
}


//struct CustomNumberPad_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomNumberPad(passcode: .constant("23"))
//    }
//}
