//
//  ForecastDay.swift
//  weather
//
//  Created by Ryan Helgeson on 2/12/24.
//

import Foundation

struct ForecastDay: Codable, Hashable {
//    let date: Date
    let date_epoch: Int
    let day: Day
    let hour: [Hour]
    let astro: Astro

}
