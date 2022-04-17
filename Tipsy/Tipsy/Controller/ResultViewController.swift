//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Matheus on 17/04/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var label: String?
    var total: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingsLabel.text = label!
        self.totalLabel.text = total!
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
