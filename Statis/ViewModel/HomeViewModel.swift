//
//  HomeViewModel.swift
//  Statis
//
//  Created by Farrukh Hameed on 17/03/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import Foundation
import CoreNFC

class HomeViewModel: NSObject, ObservableObject{
    @Published var state: AppState
    
    @Published var values = [[String]]()
    @Published var shouldPresentCard: Bool = false
    
    var firestore: FirestoreViewModel
    
    init(state: AppState){
        self.state = state
        self.firestore = FirestoreViewModel()
    }
    
    func scan(){
        let session = NFCNDEFReaderSession(
            delegate: self,
            queue: nil,
            invalidateAfterFirstRead: true
        )

        // 2
        session.alertMessage = "Hold your device near a tag to scan it."

        // 3
        session.begin()
    }
}

extension HomeViewModel: NFCNDEFReaderSessionDelegate{
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("Error NFC: \(error)")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        print("Detected tags with \(messages.count) messages")
                
        let message = messages[0]
        let record = message.records[0]
        
        let payload = String(data: record.payload, encoding: .utf8)
        if let payload = payload {
            self.firestore.getCard(id: payload, completion: {(values) in
                if let values = values {
                    var element: [String] = [
                        "user", "Full Name", values["name"] as! String
                    ]
                    self.values.append(element)
                    
                    element = [
                        "iconPhone", "Phone", values["phone"] as! String
                    ]
                    self.values.append(element)
                    
                    element = [
                        "iconBriefcase", "Work", values["job"] as! String
                    ]
                    self.values.append(element)
                    
                    element = [
                        "iconMail", "Email Address", values["email"] as! String
                    ]
                    self.values.append(element)
                    
                    element = [
                        "iconBuilding", "Company", values["joblocation"] as! String
                    ]
                    self.values.append(element)
                    
                    element = [
                        "iconGlobe", "Website", values["website"] as! String
                    ]
                    self.values.append(element)
                    
                    element = [
                        "iconLocation", "Address", values["address"] as! String
                    ]
                    self.values.append(element)
                    self.shouldPresentCard = true
                }
            })
        }
    }
    
    
}
