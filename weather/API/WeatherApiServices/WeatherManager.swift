//
//  GameManager.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation

protocol WeatherManagerDataSource {
    
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
        currentWeather = handleApiResult(result: await service.getWeather(query: query))
        forecastedWeather = handleApiResult(result: await service.getForecast(query: query, days: Constants.forecastDays))
        isLoading = false
        debugPrint("Finished refresh")
    }
    
    func handleApiResult<T: Decodable>(result: Result<Data, Error>) -> T? {
        switch result {
        case .success(let data):
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
                let container = try decoder.singleValueContainer()
                let dateStr = try container.decode(String.self)
                
                formatter.dateFormat = "yyyy-MM-dd hh:mm"
                if let date = formatter.date(from: dateStr) {
                    return date
                }
                
                throw WeatherAPIErrors.custom("Misformed Date")
            })
            
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

