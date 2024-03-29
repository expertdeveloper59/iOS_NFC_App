//
//  FirestoreService.swift
//  Statis
//
//  Created by Fateh Khan on 02/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import Foundation
import Combine
import Firebase
import FirebaseFirestoreSwift

class FBUser {
    var userEmail: String
    var phoneNo: String
    
    init(userEmail: String, phoneNo: String) {
        self.phoneNo = phoneNo
        self.userEmail = userEmail
    }
}

class FirestoreViewModel: ObservableObject {
    private var db = Firestore.firestore()
    
    func addUser(_ user: FBUser) {
        db.collection("users").addDocument(data: ["userEmail": user.userEmail, "phoneNumber": user.phoneNo])
    }
    
    func getUser(_ userEmail: String, completion: @escaping (_ pN: String) ->()) {
        db.collection("users").whereField("userEmail", isEqualTo: userEmail.lowercased())
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if let snaphshot = querySnapshot, snaphshot.documents.count > 0, let document = snaphshot.documents[0].data()["phoneNumber"] {
                        if let phone = document as? String {
                            completion(phone)
                        }
                    } else {
                        completion("nil")
                    }
                }
            }
    }
    func putCard(data: [String: String], completion: @escaping (_ id: String) -> ()){
        var ref: DocumentReference? = nil
        ref = db.collection("data").addDocument(data: data, completion: { error in
            if let error = error {
                print("Error adding document \(error)")
                completion("error")
            }else{
                completion(ref!.documentID)
            }
        })
    }
    func getCard(id: String, completion: @escaping (_ values: [String: Any]?) -> ()){
        let docRef = db.collection("data").document(id)
        
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                
                completion(data)
            }else{
                completion(nil)
            }
        }
    }
}
