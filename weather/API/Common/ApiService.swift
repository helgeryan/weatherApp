//
//  ApiService.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation

class ApiService {
    let network: WeatherNetwork = .init(sessionConfig: URLSessionConfiguration.default)
}
