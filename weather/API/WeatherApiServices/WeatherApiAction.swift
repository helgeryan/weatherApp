//
//  GameApiAction.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation

public enum GameApiAction {
    case getGames
    case getCarousel
    case getCurrentWeather(query: String)
    case getForecast(query: String, days: Int)
}

extension GameApiAction: WeatherRouter {
    var method: HTTPMethod {
        switch self {
        case .getGames:
            return .get
        case .getCarousel:
            return .get
        case .getCurrentWeather:
            return .get
        case .getForecast:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getGames :
            return "api/v2/us/music/most-played/\(10)/albums.json"
        case .getCarousel:
            return "api/v2/us/music/most-played/\(10)/albums.json"
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
        case .getGames:
            return []
        case .getCarousel:
            return []
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
