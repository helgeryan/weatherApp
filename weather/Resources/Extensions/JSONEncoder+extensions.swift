//
//  JSONEncoder+extensions.swift
//  weather
//
//  Created by Ryan Helgeson on 2/12/24.
//

import Foundation

extension JSONEncoder {
    func configureWeatherDateEncodingStrategy() {
        self.dateEncodingStrategy = .custom({ date, encoder in
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            var container = encoder.singleValueContainer()
            formatter.dateFormat = "yyyy-MM-dd hh:mm"
            let dateStr = formatter.string(from: date)
            let _ = try container.encode(dateStr)
                
            return
        })
    }
}
