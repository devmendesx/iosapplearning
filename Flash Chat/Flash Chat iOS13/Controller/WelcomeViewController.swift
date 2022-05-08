//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayAnimatedTitle()
    }
    
    func displayAnimatedTitle() {
        self.titleLabel.text = Key.appTitle
        self.titleLabel.onTypingAnimationFinished = {
            self.titleLabel.text = Key.appTitle
        }
    }
}

