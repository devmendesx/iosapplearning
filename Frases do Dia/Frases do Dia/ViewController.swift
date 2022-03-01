//
//  ViewController.swift
//  Frases do Dia
//
//  Created by Matheus on 01/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frase: UILabel!
    
    @IBAction func novaFrase(_ sender: Any) {
        
        var frases: [String] = []
        frases.append("O importante não é vencer todos os dias, mas lutar sempre.")
        frases.append("Maior que a tristeza de não haver vencido é a vergonha de não ter lutado!")
        frases.append("É melhor conquistar a si mesmo do que vencer mil batalhas.")
        frases.append("Quem ousou conquistar e saiu pra lutar, chega mais longe!")
        
    
        frase.text = frases[Int(arc4random_uniform(UInt32(frases.count)))]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

