//
//  DayWeatherCard.swift
//  weather
//
//  Created by Ryan Helgeson on 2/10/24.
//

import SwiftUI

struct DayWeatherCard: View {
    var maxTemp: Double
    var minTemp: Double
    let day: ForecastDay
    var body: some View {
        HStack {
            Text(getTimeText(epochTime: day.date_epoch))
                .modifier(RegularText())
            
            WeatherAsyncImage(imageUrl: URL(string: "https:\(day.day.condition.icon)"), width: 42, height: 42)
                .padding(.vertical, 5)
                .padding(.horizontal)
                .shadow(radius: 10)
            
           
            Text(day.day.mintemp_f.getTempString())
                .modifier(RegularText())
            
            
            GeometryReader { proxy in
                let spread: Double = maxTemp - minTemp
                let rightPadding = (maxTemp - day.day.maxtemp_f) * (proxy.size.width / spread)
                let leftPadding = (day.day.mintemp_f - minTemp) * (proxy.size.width / spread)
                ZStack {
                    RoundedRectangle(cornerRadius: 2)
                        .frame(height: 4)
                        .foregroundStyle(Color.darkGray)
                    
                    RoundedRectangle(cornerRadius: 2)
                        .frame(height: 4)
                        .foregroundStyle(LinearGradient(colors: [.blue, .yellow, .red], startPoint: .init(x: 0, y: 0), endPoint: .init(x: 1, y: 0)))
                        .mask({
                            RoundedRectangle(cornerRadius: 2)
                                .frame(height: 4)
                                .padding(.leading, leftPadding)
                                .padding(.trailing, rightPadding)
                        })
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            
            Text(day.day.maxtemp_f.getTempString())
                 .modifier(RegularText())
        }
    }
    
    func getTimeText(epochTime: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(epochTime))
        
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "eee"
        
        return formatter.string(from: date)
    }
}

#Preview {
    DayWeatherCard(maxTemp: 18.0, minTemp: 10.0, day: .init(
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
            is_sun_up: 0)))
    .background(Color.weatherLightBlue)
            
}
