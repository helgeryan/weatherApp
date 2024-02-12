//
//  CurrentWeatherResponse.swift
//  weather
//
//  Created by Ryan Helgeson on 2/8/24.
//

import Foundation

struct CurrentWeatherResponse: Codable {
    let location: Location
    let current: CurrentWeather
}



