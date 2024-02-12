//
//  Location.swift
//  weather
//
//  Created by Ryan Helgeson on 2/12/24.
//

import Foundation

struct Location: Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tz_id: String
    let localtime_epoch: Int
    let localtime: Date
}
