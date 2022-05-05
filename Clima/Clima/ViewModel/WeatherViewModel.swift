//
//  WeatherViewModel.swift
//  Clima
//
//  Created by Matheus on 04/05/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherViewModel {
    
    var conditionId: Int
    var temperature: Double
    var cityName: String
    
    var temperatureString: String {
        return String(format: "%.1f", self.temperature)
    }
    
    var conditionName: String {
        switch self.conditionId {
            case 200...232: return "cloud.bolt"
            case 300...321: return "cloud.drizzle"
            case 500...531: return "cloud.rain"
            case 600...622: return "cloud.snow"
            case 701...781: return "cloud.fog"
            case 800:       return "sun.max"
            case 801...804: return "cloud.bolt"
            default:
                return "cloud"
        }
    }
    
    init(weatherInformationModel: WeatherInformationModel) {
        self.conditionId = weatherInformationModel.weather[0].id!
        self.temperature = weatherInformationModel.main.temp!
        self.cityName = weatherInformationModel.name!
    }
}

