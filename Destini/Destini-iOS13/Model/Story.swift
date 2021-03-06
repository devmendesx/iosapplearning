//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let title: String
    let choice1: String
    let choice2: String
    let choiceMade: String??
    
    init(title:String, choice1: String, choice2: String, answer: String? = nil) {
        self.title = title
        self.choice1 = choice1
        self.choice2 = choice2
        self.choiceMade = answer
    }
    
}
