//
//  Astro.swift
//  weather
//
//  Created by Ryan Helgeson on 2/12/24.
//

import Foundation

struct Astro: Codable, Hashable {
    let sunrise: String
    let sunset: String
    let moonrise: String
    let moonset: String
    let moon_phase: String
    let moon_illumination: Int
    let is_moon_up: Int
    let is_sun_up: Int
}
