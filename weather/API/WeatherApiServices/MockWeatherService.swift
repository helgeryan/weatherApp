//
//  MockGameService.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation

struct WeatherResponse: Codable {
    
}

class MockGameService: WeatherService {
    
    let forceError: Bool
    
    let mockCurrentWeatherResponse: WeatherResponse = .init()
    let mockForecastResponse: WeatherResponse = .init()
    
    
    init(forceError: Bool) {
        self.forceError = forceError
    }
    
    func getWeather(query: String) async -> Result<Data, Error> {
        if forceError {
            return .failure(WeatherAPIErrors.custom("Mock forced error"))
        } else {
            return .success(encodeData(mockCurrentWeatherResponse))
        }
    }
    
    func getForecast(query: String, days: Int) async -> Result<Data, any Error> {
        if forceError {
            return .failure(WeatherAPIErrors.custom("Mock forced error"))
        } else {
            return .success(encodeData(mockForecastResponse))
        }
    }
    
    func encodeData<T: Codable>(_ data: T) -> Data {
        let encoder = JSONEncoder()
        return try! encoder.encode(data)
    }
}
