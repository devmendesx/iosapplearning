//
//  CalculatorService.swift
//  BMI Calculator
//
//  Created by Matheus on 14/04/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorService {

    var bodyMass: BodyMassIndexModel?
    
    mutating func calculateBMI(body: BodyMassIndexModel) {
        self.bodyMass = body
        bodyMass!.result = round((bodyMass!.weight / pow(bodyMass!.height, 2))*10)/10
        
        switch bodyMass?.result {
            case _ where (bodyMass?.result)! < 18.5:
                bodyMass?.advice = "Eat more pies!"
                bodyMass?.color = .cyan
            case _ where (bodyMass?.result)! < 24.9:
                bodyMass?.advice = "Fit as a fiddle!"
                bodyMass?.color = .green
            default:
                bodyMass?.advice = "Eat less pies!"
                bodyMass?.color = .red
        }
    }
    
    func getResult() -> BodyMassIndexModel {
        return self.bodyMass!
    }
}
