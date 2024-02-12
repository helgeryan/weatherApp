//
//  JsonDecoder.swift
//  weather
//
//  Created by Ryan Helgeson on 2/12/24.
//

import Foundation

extension JSONDecoder {
    func configureWeatherDateDecodingStrategy() {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        self.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            
            formatter.dateFormat = "yyyy-MM-dd hh:mm"
            if let date = formatter.date(from: dateStr) {
                return date
            }
            
            throw WeatherAPIErrors.custom("Misformed Date")
        })
    }
}
