//
//  ViewController.swift
//  Alcool ou Gasolina
//
//  Created by Matheus on 01/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textResult: UILabel!
    
    @IBOutlet weak var gasPrice: UITextField!
    @IBOutlet weak var alcPrice: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapHideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapHideKeyboardGesture)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func selectTheBestGas(_ sender: Any) {
        if(validateFields(gasPrice: gasPrice.text!, alcPrice: alcPrice.text!)){
            textResult.text =  "Preencha todos os campos!"
        }else{
            let gasPrice = Double(gasPrice.text!.replacingOccurrences(of: ",", with: "."))
            let alcPrice = Double(alcPrice.text!.replacingOccurrences(of: ",", with: "."))
            textResult.text = calculateTheBestGas(gasPrice: gasPrice!, alcPrice: alcPrice!)
        }
    }
    
    func calculateTheBestGas(gasPrice: Double, alcPrice: Double) -> String{
        if((alcPrice/gasPrice) >= 0.7){
            return String("Gasolina é mais em conta!")
        }else{
            return String("Álcool é mais em conta!")
        }
    }
    
    
    func validateFields(gasPrice: String, alcPrice: String) -> Bool{
        if(gasPrice.isEmpty){
            return true
        }else if alcPrice.isEmpty{
            return true
        }else{
            return false
        }
    }
}

