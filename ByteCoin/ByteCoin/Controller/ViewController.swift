//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    
    @IBOutlet weak var bitcoinValueLabel: UILabel!
    @IBOutlet weak var currentCurrencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager: CoinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
    
    
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coinManager.currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.fetchCoinPriceFor(for: coinManager.currencyArray[row])
    }
}

extension ViewController: CoinManagerDelegate {
    func didUpdateCoinPrice(with coinViewModel: CoinViewModel) {
        self.currentCurrencyLabel.text = coinViewModel.coinName?.description
        self.bitcoinValueLabel.text = String(format: "%.2f", coinViewModel.price!)
    }
    
    func didFailWithError(with error: Error) {
        print(error)
    }
}
