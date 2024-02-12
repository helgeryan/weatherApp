//
//  WeatherManager.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation

protocol WeatherManagerDataSource {
    func getCurrentWeather(query: String) async -> CurrentWeatherResponse?
    func getForecast(query: String) async -> ForecastResponse?
}

enum WeatherError: LocalizedError {
    case apiRequestFailed
    case decoderFailed
    
    var errorDescription: String? {
        switch self {
        case .apiRequestFailed:
            return "Api request failed"
        case .decoderFailed:
            return  "Decoder failed"
        }
    }
    
    var userMessage: String {
        return  "Unable to find weather data for this location at this time. Please try again."
    }
}

@MainActor
class WeatherManager: ObservableObject, WeatherManagerDataSource {
    let service: WeatherService
    @Published var isLoading: Bool = false
    @Published var currentWeather: CurrentWeatherResponse?
    @Published var forecastedWeather: ForecastResponse?
    @Published var error: WeatherError?
    
    init(service: WeatherService) {
        self.service = service
    }
    
    func refresh(with query: String) async {
        debugPrint("Starting refresh")
        isLoading = true
        error = nil
        currentWeather = await getCurrentWeather(query: query)
        forecastedWeather = await getForecast(query: query)
        isLoading = false
        debugPrint("Finished refresh")
    }
    
    func getCurrentWeather(query: String) async -> CurrentWeatherResponse? {
       return handleApiResult(result: await service.getWeather(query: query))
    }
    
    func getForecast(query: String) async -> ForecastResponse? {
       return handleApiResult(result: await service.getForecast(query: query, days: Constants.forecastDays))
    }
    
    func handleApiResult<T: Decodable>(result: Result<Data, Error>) -> T? {
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            decoder.configureWeatherDateDecodingStrategy()
            
            do {
                return try decoder.decode(T.self, from: data)
            } catch(let error) {
                debugPrint("Error: \(error)")
                self.error = WeatherError.decoderFailed
                return nil
            }
        case .failure(let error):
            debugPrint("Error: \(error)")
            self.error = WeatherError.apiRequestFailed
            return nil
        }
    }
}

