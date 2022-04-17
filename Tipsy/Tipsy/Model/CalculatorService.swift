//
//  CalculatorService.swift
//  Tipsy
//
//  Created by Matheus on 17/04/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorService {
    
    func switchTip(buttons: [UIButton], sender: UIButton) {
        for button in buttons {
            button.isSelected = false
        }
        sender.isSelected = true
    }
    
    func calculateBillSplitted(totalBill: Double, people: Int, tip: Double) -> Double{
        let finalValue = totalBill + (totalBill * tip)
        return finalValue / Double(people)
    }
}
