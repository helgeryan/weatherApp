//
//  Int+extensions.swift
//  weather
//
//  Created by Ryan Helgeson on 2/12/24.
//

import Foundation

extension Int {
    func getEpochToWeekdayText() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "eee"
        
        return formatter.string(from: date)
    }
    
    func getEpochToHourText() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "ha"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        return formatter.string(from: date)
    }
}
