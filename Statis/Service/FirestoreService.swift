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
//        Firestore().coll
//        db.collection("users").document(user.userEmail).setData(["userEmail": user.userEmail, "phoneNumber": user.phoneNo])
            db.collection("users").addDocument(data: ["userEmail": user.userEmail, "phoneNumber": user.phoneNo])
    }
    
    func getUser(_ userEmail: String, completion: @escaping (_ pN: String) ->()) {
        db.collection("users").whereField("userEmail", isEqualTo: userEmail.lowercased())
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if let snaphshot = querySnapshot {
                        let document = snaphshot.documents[0]
                        if let phone = document.data()["phoneNumber"] as? String {
                            completion(phone)
                        }
                    }
                }
            }
    }
    
}
