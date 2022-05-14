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
    var userViewModels: [UserViewModel] = []
    
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
    
    func findUserByEmail(email: String) -> UserViewModel {
        DispatchQueue.global().async {
            self.db.collection(Key.FStore.userCollectionName).whereField("email", isEqualTo: email).getDocuments { query, error in
                self.userViewModels.removeAll()
                if let err = error {
                    print(err)
                }else{
                    for user in query!.documents {
                        self.userViewModels.append(UserViewModel(fullName: user[Key.FStore.userName] as! String, age: user[Key.FStore.userAge] as! String, email: user[Key.FStore.userEmail] as! String))
                    }
                }
            }
        }
        return self.userViewModels[0]
    }
    
    
    
}
