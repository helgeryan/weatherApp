//
//  ForecastResponse.swift
//  weather
//
//  Created by Ryan Helgeson on 2/9/24.
//

import Foundation

struct ForecastResponse: Codable {
    let location: Location
    let current: CurrentWeather
    let forecast: Forecast
}
