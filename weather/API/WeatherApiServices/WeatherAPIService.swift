//
//  GamesService.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation

protocol WeatherService {
    func getWeather(query: String) async -> Result<Data, Error>
    func getForecast(query: String, days: Int) async -> Result<Data, Error>
}


class WeatherAPIService: ApiService, WeatherService {
    func getForecast(query: String, days: Int) async -> Result<Data, any Error> {
        let router = GameApiAction.getForecast(query: query, days: days)
        return await network.requestData(router)
    }
    
    func getWeather(query: String) async -> Result<Data, Error> {
        let router = GameApiAction.getCurrentWeather(query: query)
        return await network.requestData(router)
    }
}
