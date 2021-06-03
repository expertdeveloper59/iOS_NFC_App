//
//  AddCardViewModel.swift
//  Statis
//
//  Created by Farrukh Hameed on 17/03/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import Foundation
import CoreNFC

typealias NFCReadingCompletion = (Result<NFCNDEFMessage?, Error>) -> Void
typealias StringReadingCompletion = (Result<String, Error>) -> Void

class AddCardViewModel : NSObject, ObservableObject {
    @Published var state: AppState
    @Published var curValue: String
    
    @Published var isDone: Bool = false
    
    var delegateDismiss: (() -> Void)? = nil
    
    var firestore: FirestoreViewModel
    
    var ndef: NFCNDEFMessage?
    
    var values = [String: String]()
    
    init(appState: AppState) {
        self.state = appState
        self.curValue = ""
        self.firestore = FirestoreViewModel()
    }
    
    func nextPressed(question: Question){
        values[question.id] = curValue
        curValue = ""
    }
    
    func donePressed(delegate: @escaping () -> Void){
        self.delegateDismiss = delegate
        values["userid"] = self.state.user?.id
        self.firestore.putCard(data: values, completion: { id in
            if id == "error" {
                print("Error occurred!")
                return
            }
            let customTextPayload = NFCNDEFPayload.init(
                format: .nfcWellKnown,
                type: "T".data(using: .utf8)!,
                identifier: Data(),
                payload: id.data(using: .utf8)!
            )
            //let payload = NFCNDEFPayload.wellKnownTypeTextPayload(string: id, locale: Locale.init(identifier: "en"))!
            self.ndef = NFCNDEFMessage.init(records: [
                customTextPayload
            ])
            
            let session = NFCNDEFReaderSession(
                delegate: self,
                queue: nil,
                invalidateAfterFirstRead: false
            )

            // 2
            session.alertMessage = "Hold your device near a tag to write to it."

            // 3
            session.begin()
        })
    }
}

extension AddCardViewModel: NFCNDEFReaderSessionDelegate{
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        
    }
    
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("Session did invalidate with error: \(error)")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
        guard tags.count == 1 else {
            session.invalidate(errorMessage: "Can not write to more than one tag.")
            return
        }
        let currentTag = tags.first!
        
        // 2
        session.connect(to: currentTag) { error in
            
            guard error == nil else {
                session.invalidate(errorMessage: "Could not connect to tag.")
                return
            }
            
            // 3
            currentTag.queryNDEFStatus { status, capacity, error in
                
                guard error == nil else {
                    session.invalidate(errorMessage: "Could not query status of tag.")
                    return
                }
                
                switch status {
                case .notSupported: session.invalidate(errorMessage: "Tag is not supported.")
                case .readOnly:     session.invalidate(errorMessage: "Tag is only readable.")
                case .readWrite:

                    // 4
                    currentTag.writeNDEF(self.ndef!) { error in
                        
                        if error != nil {
                            print(error?.localizedDescription)
                            session.invalidate(errorMessage: "Failed to write message.")
                        } else {
                            session.alertMessage = "Successfully wrote data to tag!"
                            session.invalidate()
                            DispatchQueue.main.async {
                                self.isDone = true
                                self.delegateDismiss?()
                            }
                            
                        }
                    }
                    
                @unknown default:   session.invalidate(errorMessage: "Unknown status of tag.")
                }
            }
        }
    }
}
