//
//  ViewController.swift
//  Dog's Age
//
//  Created by Matheus on 20/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var finalAgeLabel: UILabel!
    @IBOutlet weak var inputDogAge: UITextField!
    
    @IBAction func discoverButton(_ sender: Any) {
        let finalAge = (Int(inputDogAge.text!)!) * 7
        finalAgeLabel.text = "Its human age is now " + String(finalAge) + " years old!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapHideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapHideKeyboardGesture)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
}

