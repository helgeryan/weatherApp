//
//  WeatherRouter.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation

protocol WeatherRouter {
    var method: HTTPMethod { get }
    var path: String { get }
    var baseUrl: String { get }
    var parameters: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    func asURLRequest() throws -> URLRequest
    var description: String { get }
}

extension WeatherRouter {
    func asURLRequest() throws -> URLRequest {
        let url = baseUrl + path
        guard let apiURL = URL(string: url) else {
            throw WeatherAPIErrors.invalidURL(url)
        }
        
        var urlComponents = URLComponents(url: apiURL, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = parameters
        
        guard let requestURL = urlComponents?.url else {
            throw WeatherAPIErrors.invalidParameters(parameters ?? [])
        }

        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = body

        return request
    }
    
    var description: String {
        "\(method) - \(baseUrl + path)"
    }
}
