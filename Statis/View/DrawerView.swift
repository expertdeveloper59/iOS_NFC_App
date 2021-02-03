//
//  DrawerView.swift
//  Statis
//
//  Created by Fateh on 01/02/21.
//  Copyright © Statis. All rights reserved.
//

import SwiftUI

struct DrawerContent: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color.blue
            Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                Text("Log out")
                    .modifier(TextModifier(font: UIConfiguration.buttonFont, color: .white))
            }
        }
    }
}

struct DrawerView: View {
    private let width = UIScreen.main.bounds.width - 100
    @Binding var isOpen: Bool
    
    var body: some View {
        HStack {
            DrawerContent()
                .frame(width: self.width)
                .offset(x: self.isOpen ? 0 : -self.width)
                .edgesIgnoringSafeArea(.vertical)
                .animation(.default)
            Spacer()
        }.onTapGesture {
            self.isOpen.toggle()
        }
    }
}
