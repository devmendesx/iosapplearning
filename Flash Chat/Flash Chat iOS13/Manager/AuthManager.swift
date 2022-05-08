//
//  RegisterManager.swift
//  Flash Chat iOS13
//
//  Created by Matheus on 08/05/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import FirebaseAuth
struct AuthManager {
    
    var delegate: AuthManagerDelegate?
    
    func signUp(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let _error = error {
                self.delegate?.whenDidFail(with: _error.localizedDescription)
            }else{
                self.delegate?.whenDidSuccess()
            }
        }
    }
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let _error = error {
                self.delegate?.whenDidFail(with: _error.localizedDescription)
            }else {
                self.delegate?.whenDidSuccess()
            }
        }
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut()
            self.delegate?.whenDidSuccess()
        }catch let error as NSError {
            self.delegate?.whenDidFail(with: error.localizedDescription)
        }
    }
}

protocol AuthManagerDelegate {
    func whenDidSuccess()
    func whenDidFail(with message: String)
}
