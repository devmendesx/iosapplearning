//
//  Database.swift
//  Flash Chat iOS13
//
//  Created by Matheus on 13/05/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import FirebaseFirestore
class FDatabase {
    
    let db = Firestore.firestore()
    var currentUser: UserViewModel? = nil
    
    func insertNewUser(user: User) {
        self.db.collection(Key.FStore.userCollectionName).addDocument(data: [
            Key.FStore.userName: user.name,
            Key.FStore.userAge: user.age,
            Key.FStore.userEmail: user.email
        ]) { (error) in
            if let e = error {
                print("There was an issue while saving data, \(e).")
            }
        }
    }
    
    func findUserByEmail(email: String){
        DispatchQueue.global().sync {
            self.db.collection(Key.FStore.userCollectionName).whereField("email", isEqualTo: email).getDocuments { query, error in
                if let err = error {
                    print(err)
                }else{
                    for user in query!.documents {
                        self.currentUser = UserViewModel(fullName: user[Key.FStore.userName] as! String, age: user[Key.FStore.userAge] as! String, email: user[Key.FStore.userEmail] as! String)
                    }
                }
            }
        }
    }
}
