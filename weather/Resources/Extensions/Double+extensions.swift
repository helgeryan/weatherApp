//
//  Double+extensions.swift
//  weather
//
//  Created by Ryan Helgeson on 2/11/24.
//

import Foundation

extension Double {
    func getTempString() -> String {
        return String(format: "%d\(Constants.degrees)", Int(self))
    }
}
