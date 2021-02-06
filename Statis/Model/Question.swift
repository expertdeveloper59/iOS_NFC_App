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
    
    init(question: String, TFtitle: String, image: String) {
        questionTitle = question
        textFieldTitle = TFtitle
        imageName = image
    }
}
