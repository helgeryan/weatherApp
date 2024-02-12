//
//  Condition.swift
//  weather
//
//  Created by Ryan Helgeson on 2/12/24.
//

import Foundation

struct Condition: Codable, Hashable {
    let text: String
    let icon: String
    let code: Int
    
    var iconUrl: URL? {
        return URL(string: "https:\(icon)")
    }
}
