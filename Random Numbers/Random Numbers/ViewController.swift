//
//  ViewController.swift
//  Random Numbers
//
//  Created by Matheus on 22/02/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var generatedNumber: UILabel!
    
    @IBAction func generateNumber(_ sender: Any) {
        
        let number: Int = Int(arc4random_uniform(101))
        generatedNumber.text = String(number)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

