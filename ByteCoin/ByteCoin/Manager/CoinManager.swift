//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
import Alamofire

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "4797BBFE-1357-4526-8071-709C68F46D00"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    public func fetchCoinPriceFor(for currency: String){
        let finalURL = String(format: "\(baseURL)%@", currency)
        AF.request(finalURL, method: .get, parameters: ["apikey": apiKey]).response {
            response in
            switch response.result {
                case .success(let result):
                    if let coinViewModel = self.parsingJSON(with: result!) {
                        self.delegate?.didUpdateCoinPrice(with: coinViewModel)
                    }
                case .failure(let result):
                    print(result)
            }
        }
    }
    
    
    private func parsingJSON(with data: Data) -> CoinViewModel? {
        do {
            let coinModel = try JSONDecoder().decode(CoinModel.self, from: data)
            return CoinViewModel(model: coinModel)
        }catch {
            self.delegate?.didFailWithError(with: error)
            return nil
        }
    }
}

protocol CoinManagerDelegate {
    func didUpdateCoinPrice(with coinViewModel: CoinViewModel)
    func didFailWithError(with error: Error)
}
