//
//  WeatherNetworkClient.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation

protocol WeatherNetworkClient {
    func requestData(_ router: WeatherRouter) async -> Result<Data, Error>
}
