//
//  Forecast.swift
//  weather
//
//  Created by Ryan Helgeson on 2/12/24.
//

import Foundation

struct Forecast: Codable {
    let forecastday: [ForecastDay]
    
    /// getMaxTemp()
    ///
    /// return: Max temperature in Farenheit
    func getMaxTempF() -> Double {
        var max: Double = -100
        for day in forecastday {
            if max < day.day.maxtemp_f {
                max = day.day.maxtemp_f
            }
        }
        return max
    }
    
    /// getMinTemp()
    ///
    /// return: Min temperature in Farenheit
    func getMinTempF() -> Double  {
        var max: Double = 200
        for day in forecastday {
            if max > day.day.mintemp_f {
                max = day.day.mintemp_f
            }
        }
        return max
    }
}
