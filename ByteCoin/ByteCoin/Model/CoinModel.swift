//
//  CoinModdel.swift
//  ByteCoin
//
//  Created by Matheus on 07/05/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel: Codable {
    var time: String?
    var asset_id_base: String?
    var asset_id_quote: String?
    var rate: Double?
}
