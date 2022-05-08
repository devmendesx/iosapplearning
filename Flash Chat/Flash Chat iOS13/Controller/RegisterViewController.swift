//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var authManager: AuthManager = AuthManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authManager.delegate = self
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            authManager.signUp(email: email, password: password)
        }
    }
}

extension RegisterViewController: AuthManagerDelegate {
    func whenDidSuccess() {
        performSegue(withIdentifier: Key.registerSegue, sender: self)
    }
    func whenDidFail(with message: String) {
        let alert = UIAlertController(title: "Sign-up error!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive))
        present(alert, animated: true)
    }
}
