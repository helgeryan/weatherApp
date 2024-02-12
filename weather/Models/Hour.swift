//
//  Hour.swift
//  weather
//
//  Created by Ryan Helgeson on 2/12/24.
//

import Foundation

struct Hour: Codable, Hashable {
//    let time: Date
    let time_epoch: Int
    let temp_c: Double
    let temp_f: Double
    let is_day: Int
    
    let condition: Condition
    let wind_mph: Double
    let wind_kph: Double
    let wind_degree: Int
    let wind_dir: String
    let pressure_mb: Double
    let pressure_in: Double
    let precip_mm: Double
    let precip_in: Double
    let snow_cm: Double
    let humidity: Int
    let cloud: Int
    let feelslike_c: Double
    let feelslike_f: Double
    let windchill_c: Double
    let windchill_f: Double
    let heatindex_c: Double
    let heatindex_f: Double
    let dewpoint_c: Double
    let dewpoint_f: Double
    let will_it_rain: Int
    let chance_of_rain: Int
    let will_it_snow: Int
    let chance_of_snow: Int
    let vis_km: Double
    let vis_miles: Double
    let gust_mph: Double
    let gust_kph: Double
    let uv: Double
    let short_rad: Double
    let diff_rad: Double
    
    var chanceOfPrecipitation: Int {
        return chance_of_rain > chance_of_snow ? chance_of_rain : chance_of_snow
    }
}
