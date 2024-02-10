//
//  CurrentWeather.swift
//  weather
//
//  Created by Ryan Helgeson on 2/8/24.
//

import Foundation

struct CurrentWeatherResponse: Codable {
    let location: Location
    let current: CurrentWeather
}

struct Location: Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tz_id: String
    let localtime_epoch: Int
    let localtime: Date
}

struct CurrentWeather: Codable {
    let last_updated_epoch: Int
    let last_updated: Date
    let temp_c: Double
    let temp_f: Double
    let condition: Condition
//    let is_day: Bool
    let wind_mph: Double
    let wind_kph: Double
    let wind_degree: Int
    let wind_dir: String
    let pressure_mb: Double
    let pressure_in: Double
    
    let precip_mm: Double
    let precip_in: Double
    let humidity: Int
    let cloud: Int
    let feelslike_c: Double
    let feelslike_f: Double
    let vis_miles: Double
    let vis_km: Double
    let uv: Double
    let gust_mph: Double
    let gust_kph: Double
}

struct Condition: Codable {
    let text: String
    let icon: URL
    let code: Int
}
