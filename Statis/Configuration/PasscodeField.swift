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
    @State private var numberOfCells: Int = 4
    @State private var currentlySelectedCell = 0
    @Binding var resetCode: String

    var body: some View {
        HStack {
            ForEach(0 ..< self.numberOfCells) { index in
                CharacterInputCell(textValue: $resetCode, currentlySelectedCell: self.$currentlySelectedCell, index: index)
            }
        }
    }
}

struct CharacterInputCell: View {
    @Binding var textValue: String
    @Binding var currentlySelectedCell: Int
    var textFieldWidth = UIScreen.main.bounds.width/5

    var index: Int

    var responder: Bool {
        return index == currentlySelectedCell
    }

    var body: some View {
        PCCustomTextField(text: $textValue, currentlySelectedCell: $currentlySelectedCell, isFirstResponder: responder)
            .frame(height: 20)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding([.trailing, .leading], 10)
            .padding([.vertical], 15)
            .foregroundColor(Color.white)
            .lineLimit(1)
            .multilineTextAlignment(.center)
            .background(Rectangle().fill(Color("AppLightGreen")))
    }
}

struct PCCustomTextField: UIViewRepresentable {

    class Coordinator: NSObject, UITextFieldDelegate {

        @Binding var text: String
        @Binding var currentlySelectedCell: Int

        var didBecomeFirstResponder = false

        init(text: Binding<String>, currentlySelectedCell: Binding<Int>) {
            _text = text
            _currentlySelectedCell = currentlySelectedCell
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.text = textField.text ?? ""
            }
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""

            guard let stringRange = Range(range, in: currentText) else { return false }

            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

            if updatedText.count == 2 {
                self.currentlySelectedCell += 1
            }

            return updatedText.count <= 2
        }
    }

    @Binding var text: String
    @Binding var currentlySelectedCell: Int
    var isFirstResponder: Bool = false

    func makeUIView(context: UIViewRepresentableContext<PCCustomTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        return textField
    }

    func makeCoordinator() -> PCCustomTextField.Coordinator {
        return Coordinator(text: $text, currentlySelectedCell: $currentlySelectedCell)
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<PCCustomTextField>) {
        uiView.text = text
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
}

struct CustomNumberPad_Previews: PreviewProvider {
    static var previews: some View {
        PasscodeField(resetCode: .constant(""))
    }
}
