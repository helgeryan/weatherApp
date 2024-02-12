//
//  MockGameService.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation

class MockWeatherService: WeatherService {
    static let mockLocation: Location = .init(
        name: "Chanhassen",
        region: "MN",
        country: "United States",
        lat: 45.0,
        lon: 45.0,
        tz_id: "",
        localtime_epoch: Int(Date().timeIntervalSince1970),
        localtime: Date())
    static let mockCurrentWeather: CurrentWeather = .init(
        last_updated_epoch: 1707772554,
        last_updated: Date(),
        temp_c: 0.0,
        temp_f: 32.0,
        condition: .init(
            text: "Snowy",
            icon: "",
            code: 1009),
        wind_mph: 0.0,
        wind_kph: 0.0,
        wind_degree: 0,
        wind_dir: "N",
        pressure_mb: 0.0,
        pressure_in: 0.0,
        precip_mm: 0.0,
        precip_in: 0.0,
        humidity: 0,
        cloud: 0,
        feelslike_c: 0.0,
        feelslike_f: 0.0,
        vis_miles: 0.0,
        vis_km: 0.0,
        uv: 0.0,
        gust_mph: 0.0,
        gust_kph: 0.0)
    
    let forceError: Bool
    
    static let mockCurrentWeatherResponse: CurrentWeatherResponse = .init(location: mockLocation, current: mockCurrentWeather)
    static let mockForecastResponse: ForecastResponse = .init(
        location: mockLocation,
        current: mockCurrentWeather,
        forecast: .init(forecastday: [
            Constants.demoDay
        ]))
    
    
    init(forceError: Bool) {
        self.forceError = forceError
    }
    
    func getWeather(query: String) async -> Result<Data, Error> {
        if forceError {
            return .failure(WeatherAPIErrors.custom("Mock forced error"))
        } else {
            return .success(encodeData(MockWeatherService.mockCurrentWeatherResponse))
        }
    }
    
    func getForecast(query: String, days: Int) async -> Result<Data, any Error> {
        if forceError {
            return .failure(WeatherAPIErrors.custom("Mock forced error"))
        } else {
            return .success(encodeData(MockWeatherService.mockForecastResponse))
        }
    }
    
    func encodeData<T: Codable>(_ data: T) -> Data {
        let encoder = JSONEncoder()
        encoder.configureWeatherDateEncodingStrategy()
        return try! encoder.encode(data)
    }
}
