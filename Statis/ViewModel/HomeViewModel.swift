//
//  HomeViewModel.swift
//  Statis
//
//  Created by Fateh Khan on 20/05/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import Foundation

class HomeViewModel: ObservableObject {
//    @Published var email: String = ""
    func addNewCard() {
        print("Add New Card")
    }
    
    func cardDetailsTapped(index: Int) {
        print("Card Number \(index) tapped")
    }
    
    func cardItemTapped() {
        print("Menu Item Tapped")
    }
    
    func writeButtonClicked() {
        print("Write Button Tapped")
    }
    
    func scanButtonClicked() {
        print("Scan Button Tapped")
    }
    
    func readButtonClicked() {
        print("Read Button Tapped")
    }
    
    func searchForCard(text: String) {
        print("Searched for \(text)")
    }
    
}

