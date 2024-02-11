//
//  GameManager.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation

protocol WeatherManagerDataSource {
}

@MainActor
class WeatherManager: ObservableObject {
    let service: WeatherService
    @Published var isLoading: Bool = false
    @Published var currentWeather: CurrentWeatherResponse?
    @Published var forecastedWeather: ForecastResponse?
    
    init(service: WeatherService) {
        self.service = service
    }
    
    func refresh(with query: String) async {
        debugPrint("Starting refresh")
        isLoading = true
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
                return nil
            }
        case .failure(let error):
            debugPrint("Error: \(error)")
            return nil
        }
    }
}
