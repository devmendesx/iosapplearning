//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var authManager: AuthManager = AuthManager()
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authManager.delegate = self
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            authManager.signIn(email: email, password: password)
        }
    }
    
}

extension LoginViewController: AuthManagerDelegate {
    func whenDidSuccess() {
        self.performSegue(withIdentifier: Key.loginSegue, sender: self)
    }
    func whenDidFail(with message: String) {
        let alert = UIAlertController(title: "Sign-in error!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
