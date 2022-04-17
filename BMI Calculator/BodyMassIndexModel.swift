//
//  BodyMassIndexModel.swift
//  BMI Calculator
//
//  Created by Matheus on 16/04/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct BodyMassIndexModel{
    
    var weight: Double
    var height: Double
    
    var result: Double?
    var advice: String?
    var color: UIColor?
    
    init(weight: Double, height: Double) {
        self.height = height
        self.weight = weight
    }
}
