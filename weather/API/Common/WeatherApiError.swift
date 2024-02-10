//
//  WeatherApiError.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation

enum WeatherAPIErrors: LocalizedError {
    case custom(String)
    case invalidURL(String)
    case invalidParameters([URLQueryItem])
    case invalidResponse(Error?)
    
    var errorDescription: String? {
        switch self {
        case .custom(let string):
            return "API Error: \(string)"
        case .invalidURL(let url):
            return "Invalid URL: \(url)"
        case .invalidResponse(let error):
            return "Invalid API Response: \(error?.localizedDescription ?? "")"
        case .invalidParameters(let parameters):
            return "Invalid Parameters: \(parameters)"
        }
    }
}
