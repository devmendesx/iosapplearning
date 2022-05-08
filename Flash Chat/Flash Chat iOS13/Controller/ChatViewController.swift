//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var authManager: AuthManager = AuthManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.title = Key.appTitle
        authManager.delegate = self
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    @IBAction func signOutPressed(_ sender: UIBarButtonItem) {
        authManager.signOut()
    }
    

}

extension ChatViewController: AuthManagerDelegate {
    func whenDidSuccess() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func whenDidFail(with message: String) {
        let alert = UIAlertController(title: "Sign-out error!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    
}
