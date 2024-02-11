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
    
    func getTempAttributedString(isFarenheit: Bool = true) -> AttributedString {
        let valueString = String(format: "%d\(Constants.degrees)", Int(self))
        var string: AttributedString = AttributedString(valueString)
        string.font = .systemFont(ofSize: 30, weight: .bold)
        
        var string2: AttributedString = AttributedString(isFarenheit ? "F" : "C")
        string2.font = .systemFont(ofSize: 22, weight: .bold)
        
        return string + string2
    }
}
