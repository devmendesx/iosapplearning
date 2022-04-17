//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    
    var tip: Double = 0.10
    var people: Int = 2
    var final: Double = 0.0
    
    let calculatorService: CalculatorService = CalculatorService()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        
        sender.isSelected = true
        
        let currentTip = String(sender.currentTitle!.dropLast())
        self.tip = Double(currentTip)!/100
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        people = Int(sender.value)
        splitLabel.text = people.description
    }
    
    @IBAction func calculateSplitBill(_ sender: Any) {
        if billTextField.text != "" {
            self.final = calculatorService.calculateBillSplitted(totalBill: Double(billTextField.text!)!, people: self.people, tip: self.tip)
            self.tip = self.tip * 100
            self.performSegue(withIdentifier: "resultStoryboard", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultStoryboard" {
            let destinationVC: ResultViewController = segue.destination as! ResultViewController
            destinationVC.total = String(format: "%.2f",self.final)
            destinationVC.label = "Split between \(self.people) poeple, with \(self.tip)% tip."
        }
        
    }
    
}


