//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Matheus on 08/05/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation

struct Key {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageTableViewCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    static let appTitle = "⚡️FlashChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let messagesCollectionName = "messages"
        static let userCollectionName = "users"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
        static let senderName = "fullName"
        
        static let userName: String = "name"
        static let userAge: String = "age"
        static let userEmail: String = "email"
    }
}
