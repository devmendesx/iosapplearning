//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import IPImage

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var authManager: AuthManager = AuthManager()
    var database: FDatabase = FDatabase()
    
    var messages: [MessageViewModel] = []
    var user: User? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.authManager.delegate = self
        self.tableView.dataSource = self
        setAppeareance()
        self.navigationItem.hidesBackButton = true
        self.title = Key.appTitle
        
        self.tableView.register(UINib(nibName: Key.cellNibName, bundle: nil), forCellReuseIdentifier: Key.cellIdentifier)
        
        
        self.loadMessages()
    }
    
    func setAppeareance(){
        self.view.overrideUserInterfaceStyle = .light
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: Key.BrandColors.purple)
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    
    func loadMessages(){
        database.db.collection(Key.FStore.messagesCollectionName).order(by: "date").addSnapshotListener { query, error in
            self.messages.removeAll()
            if let e = error {
                print("Error while retreiving data from Firestore, \(e)")
            }else{
                for message in query!.documents {
                    self.messages.append(MessageViewModel(sender: message[Key.FStore.senderField] as! String, body: message[Key.FStore.bodyField] as! String))
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    if(self.messages.count > 0 ){
                        self.tableView.scrollToRow(at: IndexPath(row: self.messages.count - 1 , section: 0), at: .top, animated: true)
                    }
                }
            }
        }
    }
    
    func createIPImage(fullName: String) -> UIImage{
        let ipimage = IPImage(text: fullName, radius: 30, font: UIFont(name: "Cochin-Italic", size: 30), textColor: nil, randomBackgroundColor: true).generateImage()
        return ipimage!
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageText = messageTextfield.text {
            if !messageText.isEmpty {
                let message = Message(sender: authManager.currentUser(), body: messageText)
                database.db.collection(Key.FStore.messagesCollectionName).addDocument(data: [
                    Key.FStore.senderField: message.sender,
                    Key.FStore.bodyField: message.body,
                    Key.FStore.dateField: Date().timeIntervalSince1970
                ]) { (error) in
                    if let e = error {
                        print("There was an issue while saving data, \(e).")
                    }
                }
            }
        }
        
        DispatchQueue.main.async {
            self.messageTextfield.text?.removeAll()
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
        let message = self.messages[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: Key.cellIdentifier, for: indexPath) as! MessageTableViewCell
        cell.messageBody.text = message.body
        
        if message.sender == authManager.currentUser() {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: Key.BrandColors.lightPurple)
            cell.messageBody.textColor = UIColor(named: Key.BrandColors.purple)
        }else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            //cell.leftImageView.image = self.createIPImage(fullName: self.database.getFullNameByEmail(email: message.sender))
            print(self.database.findUserByEmail(email: message.sender).age)
            cell.messageBubble.backgroundColor = UIColor(named: Key.BrandColors.purple)
            cell.messageBody.textColor = UIColor(named: Key.BrandColors.lightPurple)
        }
        
        return cell
    }
    
}
