//
//  UICustomTextField.swift
//  Flash Chat iOS13
//
//  Created by Matheus on 07/05/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

class UICustomTextField: UITextField {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        if let placeholderText = self.placeholder {
            
            let centeredParagraphStyle = NSMutableParagraphStyle()
            centeredParagraphStyle.alignment = .center
            let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle, NSAttributedString.Key.foregroundColor: UIColor.black])
            self.attributedPlaceholder = attributedPlaceholder
            
        }
        
    }
}
