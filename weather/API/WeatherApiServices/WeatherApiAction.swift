//
//  WeatherApiAction.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation

public enum WeatherApiAction {
    case getCurrentWeather(query: String)
    case getForecast(query: String, days: Int)
}

extension WeatherApiAction: WeatherRouter {
    var method: HTTPMethod {
        switch self {
        case .getCurrentWeather:
            return .get
        case .getForecast:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getCurrentWeather:
            return "current.json"
        case .getForecast:
            return "forecast.json"
        }
    }
    
    var baseUrl: String {
        return "https://api.weatherapi.com/v1/"
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getCurrentWeather(let query):
            return [
                .init(name: "key", value: "45152e194ce645bf945205207240802"),
                .init(name: "q", value: query),
                .init(name: "aqi", value: "no")
            ]
        case .getForecast(let query, let days):
            return [
                .init(name: "key", value: "45152e194ce645bf945205207240802"),
                .init(name: "q", value: query),
                .init(name: "days", value: "\(days)"),
                .init(name: "aqi", value: "no"),
                .init(name: "alerts", value: "no")
            ]
        }
        
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var body: Data? {
        return nil
    }
}
