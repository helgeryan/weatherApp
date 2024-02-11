//
//  Constants.swift
//  weather
//
//  Created by Ryan Helgeson on 2/10/24.
//

import Foundation

final class Constants {
    static let degrees: String = "\u{00B0}"
    static let forecastDays: Int = 10
    
    static let demoDay: ForecastDay = .init(
        date_epoch: 0, day: .init(
            maxtemp_c: 10.0,
            maxtemp_f: 13.0,
            mintemp_c: 12.0,
            mintemp_f: 11.0,
            avgtemp_f: 14.0,
            avgtemp_c: 15.0,
            maxwind_mph: 16.0,
            maxwind_kph: 17.0,
            totalprecip_mm: 18.0,
            totalprecip_in: 19.0,
            totalsnow_cm: 20.0,
            avgvis_km: 21.0,
            avgvis_miles: 22.0,
            avghumidity: 1,
            daily_will_it_rain: 1,
            daily_chance_of_rain: 20,
            daily_will_it_snow: 0,
            daily_chance_of_snow: 0,
            condition: .init(
                text: "Overcast",
                icon: "//cdn.weatherapi.com/weather/64x64/night/122.png",
                code: 1009),
            uv: 12.0),
        hour: [],
        astro: .init(
            sunrise: "",
            sunset: "",
            moonrise: "",
            moonset: "",
            moon_phase: "",
            moon_illumination: 0,
            is_moon_up: 0,
            is_sun_up: 0))
}
