//
//  MockWeatherService.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation

class MockWeatherService: WeatherService {
    static let mockLocation: Location = .init(
        name: "Chanhassen",
        region: "MN",
        country: "United States",
        lat: 45.0,
        lon: 45.0,
        tz_id: "",
        localtime_epoch: Int(Date().timeIntervalSince1970),
        localtime: Date())
    static let mockCurrentWeather: CurrentWeather = .init(
        last_updated_epoch: 1707772554,
        last_updated: Date(),
        temp_c: 0.0,
        temp_f: 32.0,
        condition: .init(
            text: "Snowy",
            icon: "",
            code: 1009),
        is_day: 0,
        wind_mph: 0.0,
        wind_kph: 0.0,
        wind_degree: 0,
        wind_dir: "N",
        pressure_mb: 0.0,
        pressure_in: 0.0,
        precip_mm: 0.0,
        precip_in: 0.0,
        humidity: 0,
        cloud: 0,
        feelslike_c: 0.0,
        feelslike_f: 0.0,
        vis_miles: 0.0,
        vis_km: 0.0,
        uv: 0.0,
        gust_mph: 0.0,
        gust_kph: 0.0)
    
    static let mockHour: Hour = .init(
        time_epoch: 1,
        temp_c: 10.0,
        temp_f: 20.0,
        is_day: 1,
        condition: .init(
            text: "Snowy",
            icon: "",
            code: 1009),
        wind_mph: 0.0,
        wind_kph: 0.0,
        wind_degree: 0,
        wind_dir: "N",
        pressure_mb: 0,
        pressure_in: 0,
        precip_mm: 0,
        precip_in: 0,
        snow_cm: 0,
        humidity: 0,
        cloud: 0,
        feelslike_c: 0,
        feelslike_f: 0,
        windchill_c: 0,
        windchill_f: 0,
        heatindex_c: 0,
        heatindex_f: 0,
        dewpoint_c: 0,
        dewpoint_f: 0,
        will_it_rain: 0,
        chance_of_rain: 0,
        will_it_snow: 0,
        chance_of_snow: 0,
        vis_km: 0,
        vis_miles: 0,
        gust_mph: 0,
        gust_kph: 0,
        uv: 0,
        short_rad: 0,
        diff_rad: 0)
    
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
        hour: [
            mockHour,
            mockHour,
            mockHour,
            mockHour,
            mockHour,
            mockHour,
            mockHour,
            mockHour,
            mockHour,
            mockHour,
            mockHour,
            mockHour,
            mockHour
        ],
        astro: .init(
            sunrise: "",
            sunset: "",
            moonrise: "",
            moonset: "",
            moon_phase: "",
            moon_illumination: 0,
            is_moon_up: 0,
            is_sun_up: 0))
    
    let forceError: Bool
    
    static let mockCurrentWeatherResponse: CurrentWeatherResponse = .init(location: mockLocation, current: mockCurrentWeather)
    static let mockForecastResponse: ForecastResponse = .init(
        location: mockLocation,
        current: mockCurrentWeather,
        forecast: .init(forecastday: [
            demoDay,
            demoDay,
            demoDay,
            demoDay,
            demoDay,
            demoDay,
            demoDay,
        ]))
    
    
    init(forceError: Bool) {
        self.forceError = forceError
    }
    
    func getWeather(query: String) async -> Result<Data, Error> {
        if forceError {
            return .failure(WeatherAPIErrors.custom("Mock forced error"))
        } else {
            return .success(encodeData(MockWeatherService.mockCurrentWeatherResponse))
        }
    }
    
    func getForecast(query: String, days: Int) async -> Result<Data, any Error> {
        if forceError {
            return .failure(WeatherAPIErrors.custom("Mock forced error"))
        } else {
            return .success(encodeData(MockWeatherService.mockForecastResponse))
        }
    }
    
    func encodeData<T: Codable>(_ data: T) -> Data {
        let encoder = JSONEncoder()
        encoder.configureWeatherDateEncodingStrategy()
        return try! encoder.encode(data)
    }
}
