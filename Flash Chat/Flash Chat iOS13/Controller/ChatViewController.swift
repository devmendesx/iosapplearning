//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var authManager: AuthManager = AuthManager()
    
    var messages: [MessageViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.authManager.delegate = self
        self.tableView.dataSource = self
        
        self.navigationItem.hidesBackButton = true
        self.title = Key.appTitle
        
        self.tableView.register(UINib(nibName: Key.cellNibName, bundle: nil), forCellReuseIdentifier: Key.cellIdentifier)
        
        self.loadMessages()
    }
    
    func loadMessages(){
        FDatabase.db.collection(Key.FStore.collectionName).order(by: "date").addSnapshotListener { query, error in
            self.messages.removeAll()
            if let e = error {
                print("Error while retreiving data from Firestore, \(e)")
            }else{
                for message in query!.documents {
                    self.messages.append(MessageViewModel(sender: message[Key.FStore.senderField] as! String, body: message[Key.FStore.bodyField] as! String))
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageText = messageTextfield.text {
            let message = Message(sender: authManager.currentUser(), body: messageText)
            FDatabase.db.collection(Key.FStore.collectionName).addDocument(data: [
                Key.FStore.senderField: message.sender,
                Key.FStore.bodyField: message.body,
                Key.FStore.dateField: Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error {
                    print("There was an issue while saving data, \(e).")
                }
            }
        }
        
        self.messageTextfield.text?.removeAll()
        
        DispatchQueue.main.async {
            self.loadMessages()
        }
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

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Key.cellIdentifier, for: indexPath) as! MessageTableViewCell
        cell.messageBody.text = messages[indexPath.row].body
        return cell
    }
    
}
