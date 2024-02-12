//
//  Forecast.swift
//  weather
//
//  Created by Ryan Helgeson on 2/9/24.
//

import Foundation

struct ForecastResponse: Codable {
    let location: Location
    let current: CurrentWeather
    let forecast: Forecast
}

struct Forecast: Codable {
    let forecastday: [ForecastDay]
    
    /// getMaxTemp()
    ///
    /// return: Max temperature in Farenheit
    func getMaxTempF() -> Double {
        var max: Double = -100
        for day in forecastday {
            if max < day.day.maxtemp_f {
                max = day.day.maxtemp_f
            }
        }
        return max
    }
    
    /// getMinTemp()
    ///
    /// return: Min temperature in Farenheit
    func getMinTempF() -> Double  {
        var max: Double = 200
        for day in forecastday {
            if max > day.day.mintemp_f {
                max = day.day.mintemp_f
            }
        }
        return max
    }
}

struct ForecastDay: Codable, Hashable {
//    let date: Date
    let date_epoch: Int
    let day: Day
    let hour: [Hour]
    let astro: Astro

}

struct Day: Codable, Hashable {
    let maxtemp_c: Double
    let maxtemp_f: Double
    let mintemp_c: Double
    let mintemp_f: Double
    let avgtemp_f: Double
    let avgtemp_c: Double
    let maxwind_mph: Double
    let maxwind_kph: Double
    let totalprecip_mm: Double
    let totalprecip_in: Double
    let totalsnow_cm: Double
    let avgvis_km: Double
    let avgvis_miles: Double
    let avghumidity: Int
    let daily_will_it_rain: Int
    let daily_chance_of_rain: Int
    let daily_will_it_snow: Int
    let daily_chance_of_snow: Int
    let condition: Condition
    let uv: Double
}

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
//
//"vis_km": 10.0,
//"vis_miles": 6.0,
//"gust_mph": 23.5,
//"gust_kph": 37.8,
//"uv": 1.0,
//"short_rad": 0.0,
//"diff_rad": 0.0
//    
//    "forecast": {
//        "forecastday": [
//            {
//                "hour": [
//                    {
//                        "time_epoch": 1707436800,
//                        "time": "2024-02-09 00:00",
//                        "temp_c": 10.7,
//                        "temp_f": 51.3,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 15.9,
//                        "wind_kph": 25.6,
//                        "wind_degree": 196,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 979.0,
//                        "pressure_in": 28.9,
//                        "precip_mm": 0.07,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 89,
//                        "cloud": 100,
//                        "feelslike_c": 7.9,
//                        "feelslike_f": 46.1,
//                        "windchill_c": 7.9,
//                        "windchill_f": 46.1,
//                        "heatindex_c": 10.7,
//                        "heatindex_f": 51.3,
//                        "dewpoint_c": 9.1,
//                        "dewpoint_f": 48.3,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 23.5,
//                        "gust_kph": 37.8,
//                        "uv": 1.0,
//                        "short_rad": 0.0,
//                        "diff_rad": 0.0
//                    },
//                    {
//                        "time_epoch": 1707440400,
//                        "time": "2024-02-09 01:00",
//                        "temp_c": 10.8,
//                        "temp_f": 51.5,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Light rain shower",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/353.png",
//                            "code": 1240
//                        },
//                        "wind_mph": 17.0,
//                        "wind_kph": 27.4,
//                        "wind_degree": 195,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 978.0,
//                        "pressure_in": 28.87,
//                        "precip_mm": 0.36,
//                        "precip_in": 0.01,
//                        "snow_cm": 0.0,
//                        "humidity": 90,
//                        "cloud": 100,
//                        "feelslike_c": 7.9,
//                        "feelslike_f": 46.1,
//                        "windchill_c": 7.9,
//                        "windchill_f": 46.1,
//                        "heatindex_c": 10.8,
//                        "heatindex_f": 51.5,
//                        "dewpoint_c": 9.3,
//                        "dewpoint_f": 48.8,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 25.2,
//                        "gust_kph": 40.6,
//                        "uv": 1.0,
//                        "short_rad": 0.0,
//                        "diff_rad": 0.0
//                    },
//                    {
//                        "time_epoch": 1707444000,
//                        "time": "2024-02-09 02:00",
//                        "temp_c": 11.1,
//                        "temp_f": 52.1,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 15.2,
//                        "wind_kph": 24.5,
//                        "wind_degree": 197,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 977.0,
//                        "pressure_in": 28.85,
//                        "precip_mm": 0.02,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 87,
//                        "cloud": 100,
//                        "feelslike_c": 8.5,
//                        "feelslike_f": 47.2,
//                        "windchill_c": 8.5,
//                        "windchill_f": 47.2,
//                        "heatindex_c": 11.1,
//                        "heatindex_f": 52.1,
//                        "dewpoint_c": 9.0,
//                        "dewpoint_f": 48.2,
//                        "will_it_rain": 0,
//                        "chance_of_rain": 70,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 22.6,
//                        "gust_kph": 36.4,
//                        "uv": 1.0,
//                        "short_rad": 0.0,
//                        "diff_rad": 0.0
//                    },
//                    {
//                        "time_epoch": 1707447600,
//                        "time": "2024-02-09 03:00",
//                        "temp_c": 10.8,
//                        "temp_f": 51.4,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Light rain shower",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/353.png",
//                            "code": 1240
//                        },
//                        "wind_mph": 12.3,
//                        "wind_kph": 19.8,
//                        "wind_degree": 193,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 976.0,
//                        "pressure_in": 28.83,
//                        "precip_mm": 0.25,
//                        "precip_in": 0.01,
//                        "snow_cm": 0.0,
//                        "humidity": 89,
//                        "cloud": 100,
//                        "feelslike_c": 8.4,
//                        "feelslike_f": 47.1,
//                        "windchill_c": 8.4,
//                        "windchill_f": 47.1,
//                        "heatindex_c": 10.8,
//                        "heatindex_f": 51.5,
//                        "dewpoint_c": 9.1,
//                        "dewpoint_f": 48.4,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 18.2,
//                        "gust_kph": 29.3,
//                        "uv": 1.0,
//                        "short_rad": 0.0,
//                        "diff_rad": 0.0
//                    },
//                    {
//                        "time_epoch": 1707451200,
//                        "time": "2024-02-09 04:00",
//                        "temp_c": 10.7,
//                        "temp_f": 51.3,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Light rain shower",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/353.png",
//                            "code": 1240
//                        },
//                        "wind_mph": 13.0,
//                        "wind_kph": 20.9,
//                        "wind_degree": 201,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 976.0,
//                        "pressure_in": 28.82,
//                        "precip_mm": 0.94,
//                        "precip_in": 0.04,
//                        "snow_cm": 0.0,
//                        "humidity": 89,
//                        "cloud": 100,
//                        "feelslike_c": 8.2,
//                        "feelslike_f": 46.8,
//                        "windchill_c": 8.2,
//                        "windchill_f": 46.8,
//                        "heatindex_c": 10.7,
//                        "heatindex_f": 51.3,
//                        "dewpoint_c": 8.9,
//                        "dewpoint_f": 48.1,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 19.1,
//                        "gust_kph": 30.7,
//                        "uv": 1.0,
//                        "short_rad": 0.0,
//                        "diff_rad": 0.0
//                    },
//                    {
//                        "time_epoch": 1707454800,
//                        "time": "2024-02-09 05:00",
//                        "temp_c": 10.3,
//                        "temp_f": 50.6,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Light rain shower",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/353.png",
//                            "code": 1240
//                        },
//                        "wind_mph": 10.5,
//                        "wind_kph": 16.9,
//                        "wind_degree": 205,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 976.0,
//                        "pressure_in": 28.83,
//                        "precip_mm": 1.1,
//                        "precip_in": 0.04,
//                        "snow_cm": 0.0,
//                        "humidity": 91,
//                        "cloud": 100,
//                        "feelslike_c": 8.1,
//                        "feelslike_f": 46.6,
//                        "windchill_c": 8.1,
//                        "windchill_f": 46.6,
//                        "heatindex_c": 10.3,
//                        "heatindex_f": 50.6,
//                        "dewpoint_c": 8.9,
//                        "dewpoint_f": 48.0,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 15.4,
//                        "gust_kph": 24.7,
//                        "uv": 1.0,
//                        "short_rad": 0.0,
//                        "diff_rad": 0.0
//                    },
//                    {
//                        "time_epoch": 1707458400,
//                        "time": "2024-02-09 06:00",
//                        "temp_c": 10.4,
//                        "temp_f": 50.7,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 11.6,
//                        "wind_kph": 18.7,
//                        "wind_degree": 204,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 976.0,
//                        "pressure_in": 28.83,
//                        "precip_mm": 0.07,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 87,
//                        "cloud": 100,
//                        "feelslike_c": 8.0,
//                        "feelslike_f": 46.3,
//                        "windchill_c": 8.0,
//                        "windchill_f": 46.3,
//                        "heatindex_c": 10.4,
//                        "heatindex_f": 50.7,
//                        "dewpoint_c": 8.3,
//                        "dewpoint_f": 46.9,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 16.7,
//                        "gust_kph": 26.9,
//                        "uv": 1.0,
//                        "short_rad": 0.0,
//                        "diff_rad": 0.0
//                    },
//                    {
//                        "time_epoch": 1707462000,
//                        "time": "2024-02-09 07:00",
//                        "temp_c": 10.1,
//                        "temp_f": 50.2,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Light rain",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/296.png",
//                            "code": 1183
//                        },
//                        "wind_mph": 12.8,
//                        "wind_kph": 20.5,
//                        "wind_degree": 216,
//                        "wind_dir": "SW",
//                        "pressure_mb": 976.0,
//                        "pressure_in": 28.83,
//                        "precip_mm": 2.08,
//                        "precip_in": 0.08,
//                        "snow_cm": 0.0,
//                        "humidity": 91,
//                        "cloud": 100,
//                        "feelslike_c": 7.5,
//                        "feelslike_f": 45.5,
//                        "windchill_c": 7.5,
//                        "windchill_f": 45.5,
//                        "heatindex_c": 10.1,
//                        "heatindex_f": 50.2,
//                        "dewpoint_c": 8.7,
//                        "dewpoint_f": 47.6,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 9.0,
//                        "vis_miles": 5.0,
//                        "gust_mph": 18.8,
//                        "gust_kph": 30.3,
//                        "uv": 1.0,
//                        "short_rad": 0.0,
//                        "diff_rad": 0.0
//                    },
//                    {
//                        "time_epoch": 1707465600,
//                        "time": "2024-02-09 08:00",
//                        "temp_c": 10.4,
//                        "temp_f": 50.7,
//                        "is_day": 1,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 13.4,
//                        "wind_kph": 21.6,
//                        "wind_degree": 220,
//                        "wind_dir": "SW",
//                        "pressure_mb": 977.0,
//                        "pressure_in": 28.86,
//                        "precip_mm": 0.11,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 88,
//                        "cloud": 100,
//                        "feelslike_c": 7.7,
//                        "feelslike_f": 45.9,
//                        "windchill_c": 7.7,
//                        "windchill_f": 45.9,
//                        "heatindex_c": 10.4,
//                        "heatindex_f": 50.7,
//                        "dewpoint_c": 8.5,
//                        "dewpoint_f": 47.2,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 19.6,
//                        "gust_kph": 31.5,
//                        "uv": 3.0,
//                        "short_rad": 0.24,
//                        "diff_rad": 0.15
//                    },
//                    {
//                        "time_epoch": 1707469200,
//                        "time": "2024-02-09 09:00",
//                        "temp_c": 10.6,
//                        "temp_f": 51.1,
//                        "is_day": 1,
//                        "condition": {
//                            "text": "Light rain shower",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/day/353.png",
//                            "code": 1240
//                        },
//                        "wind_mph": 15.4,
//                        "wind_kph": 24.8,
//                        "wind_degree": 209,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 977.0,
//                        "pressure_in": 28.85,
//                        "precip_mm": 0.16,
//                        "precip_in": 0.01,
//                        "snow_cm": 0.0,
//                        "humidity": 90,
//                        "cloud": 100,
//                        "feelslike_c": 7.8,
//                        "feelslike_f": 46.0,
//                        "windchill_c": 7.8,
//                        "windchill_f": 46.0,
//                        "heatindex_c": 10.6,
//                        "heatindex_f": 51.1,
//                        "dewpoint_c": 9.0,
//                        "dewpoint_f": 48.2,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 22.5,
//                        "gust_kph": 36.2,
//                        "uv": 3.0,
//                        "short_rad": 3.64,
//                        "diff_rad": 2.26
//                    },
//                    {
//                        "time_epoch": 1707472800,
//                        "time": "2024-02-09 10:00",
//                        "temp_c": 10.8,
//                        "temp_f": 51.4,
//                        "is_day": 1,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 17.7,
//                        "wind_kph": 28.4,
//                        "wind_degree": 212,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 978.0,
//                        "pressure_in": 28.87,
//                        "precip_mm": 0.08,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 86,
//                        "cloud": 100,
//                        "feelslike_c": 7.7,
//                        "feelslike_f": 45.8,
//                        "windchill_c": 7.7,
//                        "windchill_f": 45.8,
//                        "heatindex_c": 10.8,
//                        "heatindex_f": 51.4,
//                        "dewpoint_c": 8.6,
//                        "dewpoint_f": 47.5,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 25.4,
//                        "gust_kph": 40.9,
//                        "uv": 3.0,
//                        "short_rad": 6.66,
//                        "diff_rad": 4.28
//                    },
//                    {
//                        "time_epoch": 1707476400,
//                        "time": "2024-02-09 11:00",
//                        "temp_c": 10.8,
//                        "temp_f": 51.5,
//                        "is_day": 1,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 16.6,
//                        "wind_kph": 26.6,
//                        "wind_degree": 211,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 978.0,
//                        "pressure_in": 28.88,
//                        "precip_mm": 0.02,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 86,
//                        "cloud": 100,
//                        "feelslike_c": 7.9,
//                        "feelslike_f": 46.2,
//                        "windchill_c": 7.9,
//                        "windchill_f": 46.2,
//                        "heatindex_c": 10.8,
//                        "heatindex_f": 51.5,
//                        "dewpoint_c": 8.5,
//                        "dewpoint_f": 47.3,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 72,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 24.0,
//                        "gust_kph": 38.7,
//                        "uv": 3.0,
//                        "short_rad": 9.04,
//                        "diff_rad": 5.97
//                    },
//                    {
//                        "time_epoch": 1707480000,
//                        "time": "2024-02-09 12:00",
//                        "temp_c": 11.5,
//                        "temp_f": 52.7,
//                        "is_day": 1,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 16.6,
//                        "wind_kph": 26.6,
//                        "wind_degree": 212,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 978.0,
//                        "pressure_in": 28.89,
//                        "precip_mm": 0.04,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 81,
//                        "cloud": 100,
//                        "feelslike_c": 8.7,
//                        "feelslike_f": 47.7,
//                        "windchill_c": 8.7,
//                        "windchill_f": 47.7,
//                        "heatindex_c": 11.5,
//                        "heatindex_f": 52.7,
//                        "dewpoint_c": 8.4,
//                        "dewpoint_f": 47.1,
//                        "will_it_rain": 0,
//                        "chance_of_rain": 61,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 23.3,
//                        "gust_kph": 37.5,
//                        "uv": 3.0,
//                        "short_rad": 23.6,
//                        "diff_rad": 14.16
//                    },
//                    {
//                        "time_epoch": 1707483600,
//                        "time": "2024-02-09 13:00",
//                        "temp_c": 12.0,
//                        "temp_f": 53.5,
//                        "is_day": 1,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 15.9,
//                        "wind_kph": 25.6,
//                        "wind_degree": 211,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 978.0,
//                        "pressure_in": 28.89,
//                        "precip_mm": 0.06,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 77,
//                        "cloud": 98,
//                        "feelslike_c": 9.4,
//                        "feelslike_f": 49.0,
//                        "windchill_c": 9.4,
//                        "windchill_f": 49.0,
//                        "heatindex_c": 12.0,
//                        "heatindex_f": 53.5,
//                        "dewpoint_c": 8.0,
//                        "dewpoint_f": 46.5,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 21.6,
//                        "gust_kph": 34.8,
//                        "uv": 3.0,
//                        "short_rad": 159.94,
//                        "diff_rad": 86.98
//                    },
//                    {
//                        "time_epoch": 1707487200,
//                        "time": "2024-02-09 14:00",
//                        "temp_c": 12.1,
//                        "temp_f": 53.7,
//                        "is_day": 1,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 14.5,
//                        "wind_kph": 23.4,
//                        "wind_degree": 209,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 978.0,
//                        "pressure_in": 28.88,
//                        "precip_mm": 0.05,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 77,
//                        "cloud": 83,
//                        "feelslike_c": 9.7,
//                        "feelslike_f": 49.5,
//                        "windchill_c": 9.7,
//                        "windchill_f": 49.5,
//                        "heatindex_c": 12.1,
//                        "heatindex_f": 53.7,
//                        "dewpoint_c": 8.1,
//                        "dewpoint_f": 46.6,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 19.8,
//                        "gust_kph": 31.9,
//                        "uv": 3.0,
//                        "short_rad": 154.4,
//                        "diff_rad": 84.06
//                    },
//                    {
//                        "time_epoch": 1707490800,
//                        "time": "2024-02-09 15:00",
//                        "temp_c": 11.9,
//                        "temp_f": 53.4,
//                        "is_day": 1,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 13.6,
//                        "wind_kph": 22.0,
//                        "wind_degree": 205,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 978.0,
//                        "pressure_in": 28.88,
//                        "precip_mm": 0.06,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 78,
//                        "cloud": 100,
//                        "feelslike_c": 9.6,
//                        "feelslike_f": 49.3,
//                        "windchill_c": 9.6,
//                        "windchill_f": 49.3,
//                        "heatindex_c": 11.9,
//                        "heatindex_f": 53.4,
//                        "dewpoint_c": 8.2,
//                        "dewpoint_f": 46.8,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 18.5,
//                        "gust_kph": 29.8,
//                        "uv": 3.0,
//                        "short_rad": 158.94,
//                        "diff_rad": 83.78
//                    },
//                    {
//                        "time_epoch": 1707494400,
//                        "time": "2024-02-09 16:00",
//                        "temp_c": 11.4,
//                        "temp_f": 52.5,
//                        "is_day": 1,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 13.2,
//                        "wind_kph": 21.2,
//                        "wind_degree": 201,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 978.0,
//                        "pressure_in": 28.88,
//                        "precip_mm": 0.14,
//                        "precip_in": 0.01,
//                        "snow_cm": 0.0,
//                        "humidity": 82,
//                        "cloud": 100,
//                        "feelslike_c": 9.0,
//                        "feelslike_f": 48.2,
//                        "windchill_c": 9.0,
//                        "windchill_f": 48.2,
//                        "heatindex_c": 11.4,
//                        "heatindex_f": 52.5,
//                        "dewpoint_c": 8.5,
//                        "dewpoint_f": 47.3,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 19.0,
//                        "gust_kph": 30.6,
//                        "uv": 3.0,
//                        "short_rad": 128.14,
//                        "diff_rad": 67.98
//                    },
//                    {
//                        "time_epoch": 1707498000,
//                        "time": "2024-02-09 17:00",
//                        "temp_c": 11.0,
//                        "temp_f": 51.8,
//                        "is_day": 1,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 12.3,
//                        "wind_kph": 19.8,
//                        "wind_degree": 190,
//                        "wind_dir": "S",
//                        "pressure_mb": 978.0,
//                        "pressure_in": 28.88,
//                        "precip_mm": 0.06,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 86,
//                        "cloud": 100,
//                        "feelslike_c": 8.6,
//                        "feelslike_f": 47.5,
//                        "windchill_c": 8.6,
//                        "windchill_f": 47.5,
//                        "heatindex_c": 11.0,
//                        "heatindex_f": 51.8,
//                        "dewpoint_c": 8.7,
//                        "dewpoint_f": 47.6,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 18.1,
//                        "gust_kph": 29.2,
//                        "uv": 3.0,
//                        "short_rad": 105.96,
//                        "diff_rad": 56.13
//                    },
//                    {
//                        "time_epoch": 1707501600,
//                        "time": "2024-02-09 18:00",
//                        "temp_c": 10.8,
//                        "temp_f": 51.4,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Light rain shower",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/353.png",
//                            "code": 1240
//                        },
//                        "wind_mph": 11.6,
//                        "wind_kph": 18.7,
//                        "wind_degree": 191,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 978.0,
//                        "pressure_in": 28.89,
//                        "precip_mm": 0.17,
//                        "precip_in": 0.01,
//                        "snow_cm": 0.0,
//                        "humidity": 87,
//                        "cloud": 100,
//                        "feelslike_c": 8.5,
//                        "feelslike_f": 47.3,
//                        "windchill_c": 8.5,
//                        "windchill_f": 47.3,
//                        "heatindex_c": 10.8,
//                        "heatindex_f": 51.4,
//                        "dewpoint_c": 8.8,
//                        "dewpoint_f": 47.8,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 17.1,
//                        "gust_kph": 27.5,
//                        "uv": 1.0,
//                        "short_rad": 88.3,
//                        "diff_rad": 46.77
//                    },
//                    {
//                        "time_epoch": 1707505200,
//                        "time": "2024-02-09 19:00",
//                        "temp_c": 10.7,
//                        "temp_f": 51.3,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 10.3,
//                        "wind_kph": 16.6,
//                        "wind_degree": 197,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 978.0,
//                        "pressure_in": 28.89,
//                        "precip_mm": 0.01,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 88,
//                        "cloud": 100,
//                        "feelslike_c": 8.6,
//                        "feelslike_f": 47.5,
//                        "windchill_c": 8.6,
//                        "windchill_f": 47.5,
//                        "heatindex_c": 10.7,
//                        "heatindex_f": 51.3,
//                        "dewpoint_c": 8.8,
//                        "dewpoint_f": 47.9,
//                        "will_it_rain": 0,
//                        "chance_of_rain": 68,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 15.1,
//                        "gust_kph": 24.3,
//                        "uv": 1.0,
//                        "short_rad": 0.0,
//                        "diff_rad": 0.0
//                    },
//                    {
//                        "time_epoch": 1707508800,
//                        "time": "2024-02-09 20:00",
//                        "temp_c": 10.5,
//                        "temp_f": 50.8,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Light rain shower",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/353.png",
//                            "code": 1240
//                        },
//                        "wind_mph": 9.6,
//                        "wind_kph": 15.5,
//                        "wind_degree": 197,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 979.0,
//                        "pressure_in": 28.9,
//                        "precip_mm": 0.2,
//                        "precip_in": 0.01,
//                        "snow_cm": 0.0,
//                        "humidity": 89,
//                        "cloud": 82,
//                        "feelslike_c": 8.4,
//                        "feelslike_f": 47.2,
//                        "windchill_c": 8.4,
//                        "windchill_f": 47.2,
//                        "heatindex_c": 10.5,
//                        "heatindex_f": 50.8,
//                        "dewpoint_c": 8.7,
//                        "dewpoint_f": 47.7,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 100,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 14.2,
//                        "gust_kph": 22.9,
//                        "uv": 1.0,
//                        "short_rad": 0.0,
//                        "diff_rad": 0.0
//                    },
//                    {
//                        "time_epoch": 1707512400,
//                        "time": "2024-02-09 21:00",
//                        "temp_c": 10.0,
//                        "temp_f": 50.0,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 9.4,
//                        "wind_kph": 15.1,
//                        "wind_degree": 202,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 979.0,
//                        "pressure_in": 28.92,
//                        "precip_mm": 0.02,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 90,
//                        "cloud": 92,
//                        "feelslike_c": 7.9,
//                        "feelslike_f": 46.2,
//                        "windchill_c": 7.9,
//                        "windchill_f": 46.2,
//                        "heatindex_c": 10.0,
//                        "heatindex_f": 50.0,
//                        "dewpoint_c": 8.5,
//                        "dewpoint_f": 47.3,
//                        "will_it_rain": 0,
//                        "chance_of_rain": 65,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 13.9,
//                        "gust_kph": 22.4,
//                        "uv": 1.0,
//                        "short_rad": 0.0,
//                        "diff_rad": 0.0
//                    },
//                    {
//                        "time_epoch": 1707516000,
//                        "time": "2024-02-09 22:00",
//                        "temp_c": 9.7,
//                        "temp_f": 49.5,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Patchy rain nearby",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png",
//                            "code": 1063
//                        },
//                        "wind_mph": 7.4,
//                        "wind_kph": 11.9,
//                        "wind_degree": 204,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 980.0,
//                        "pressure_in": 28.93,
//                        "precip_mm": 0.02,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 91,
//                        "cloud": 100,
//                        "feelslike_c": 8.0,
//                        "feelslike_f": 46.3,
//                        "windchill_c": 8.0,
//                        "windchill_f": 46.3,
//                        "heatindex_c": 9.7,
//                        "heatindex_f": 49.5,
//                        "dewpoint_c": 8.3,
//                        "dewpoint_f": 47.0,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 85,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 11.0,
//                        "gust_kph": 17.7,
//                        "uv": 1.0,
//                        "short_rad": 0.0,
//                        "diff_rad": 0.0
//                    },
//                    {
//                        "time_epoch": 1707519600,
//                        "time": "2024-02-09 23:00",
//                        "temp_c": 10.0,
//                        "temp_f": 50.0,
//                        "is_day": 0,
//                        "condition": {
//                            "text": "Overcast",
//                            "icon": "//cdn.weatherapi.com/weather/64x64/night/122.png",
//                            "code": 1009
//                        },
//                        "wind_mph": 5.6,
//                        "wind_kph": 9.0,
//                        "wind_degree": 200,
//                        "wind_dir": "SSW",
//                        "pressure_mb": 979.0,
//                        "pressure_in": 28.91,
//                        "precip_mm": 0.02,
//                        "precip_in": 0.0,
//                        "snow_cm": 0.0,
//                        "humidity": 94,
//                        "cloud": 100,
//                        "feelslike_c": 8.3,
//                        "feelslike_f": 46.9,
//                        "windchill_c": 8.3,
//                        "windchill_f": 46.9,
//                        "heatindex_c": 9.7,
//                        "heatindex_f": 49.4,
//                        "dewpoint_c": 8.8,
//                        "dewpoint_f": 47.8,
//                        "will_it_rain": 1,
//                        "chance_of_rain": 88,
//                        "will_it_snow": 0,
//                        "chance_of_snow": 0,
//                        "vis_km": 10.0,
//                        "vis_miles": 6.0,
//                        "gust_mph": 9.1,
//                        "gust_kph": 14.7,
//                        "uv": 1.0,
//                        "short_rad": 0.0,
//                        "diff_rad": 0.0
//                    }
//                ]
//            }
//        ]
//    }
//}
