//
//  Weather.swift
//  Clima
//
//  Created by Matheus on 02/05/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherInformationModel: Decodable {
    let id: Int?
    let name: String?
    let base: String?
    let cod: Int?
    let timezone: Int?
    let dt: Int?
    let visibility: Int?
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let clouds: Clouds
    let sys: Sys
}

struct Main: Decodable {
    let temp: Double?
    let feels_like: Double?
    let temp_min: Double?
    let temp_max: Double?
    let pressure: Double?
    let humidity: Double?
    let sea_level: Int?
    let grnd_level: Int?
}

struct Weather: Decodable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

struct Wind: Decodable {
    let speed: Double?
    let deg: Double?
    let gust: Double?
}

struct Clouds: Decodable {
    let all: Int?
}

struct Sys: Decodable {
    let type: Int?
    let id: Int?
    let country: String?
    let sunrise: Int?
    let sunset: Int?
}

struct Coord: Decodable {
    let lon: Double?
    let lat: Double?
}


