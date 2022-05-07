//
//  CoinViewModel.swift
//  ByteCoin
//
//  Created by Matheus on 07/05/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinViewModel {
    var price: Double?
    var coinName: String?
    
    init(model: CoinModel){
        self.price = model.rate
        self.coinName = model.asset_id_quote
    }
}
