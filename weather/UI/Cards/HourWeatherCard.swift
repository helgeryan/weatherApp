//
//  HourWeatherCard.swift
//  weather
//
//  Created by Ryan Helgeson on 2/11/24.
//

import SwiftUI

struct HourWeatherCard: View {
    let hour: Hour
    var body: some View {
        VStack(spacing: 0) {
            Text(getTimeText(epochTime: hour.time_epoch))
                .modifier(BoldText(fontSize: 11))
                .padding(.top)
            
            WeatherAsyncImage(imageUrl: URL(string: "https:\(hour.condition.icon)") , width: 40, height: 40)
                .padding(.horizontal)
                .shadow(radius: 10.0)
            
            Text(hour.temp_f.getTempString())
                .modifier(BoldText(fontSize: 11))
                .padding(.bottom)
        }
    }
    
    func getTimeText(epochTime: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(epochTime))
        
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "ha"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        return formatter.string(from: date)
    }
}

#Preview {
    HourWeatherCard(hour: .init(
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
        diff_rad: 0))
    .background(Color.blue)
}
