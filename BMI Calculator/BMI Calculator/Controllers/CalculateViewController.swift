//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlide: UISlider!
    @IBOutlet weak var heightSlide: UISlider!

    var calcService = CalculatorService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2fm", sender.value)
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightLabel.text = String(format: "%.1fkg", sender.value)
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        let height = round(heightSlide.value*100)/100
        let weight = round(weightSlide.value*100)/100
        calcService.calculateBMI(body: BodyMassIndexModel(weight: Double(weight), height: Double(height)))
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC: ResultViewController = segue.destination as! ResultViewController
            let body: BodyMassIndexModel = calcService.getResult()
            destinationVC.bmiValue = String(body.result ?? 0.0)
            destinationVC.bmiAdvice = String(body.advice ?? "No advice!")
            destinationVC.view.backgroundColor = body.color ?? .white
        }
    }
}

