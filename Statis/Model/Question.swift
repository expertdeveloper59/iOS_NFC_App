//
//  Question.swift
//  Statis
//
//  Created by Fateh Khan on 06/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import Foundation

class Question: ObservableObject {
    @Published var questionTitle: String
    @Published var textFieldTitle: String
    @Published var imageName: String
    @Published var id: String
    
    init(id: String, question: String, TFtitle: String, image: String) {
        self.id = id
        questionTitle = question
        textFieldTitle = TFtitle
        imageName = image
    }
}
