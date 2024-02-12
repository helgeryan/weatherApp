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
            Text(day.date_epoch.getEpochToWeekdayText())
                .modifier(RegularText())
            
            WeatherAsyncImage(imageUrl: day.day.condition.iconUrl, width: 42, height: 42)
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
                        .foregroundStyle(Color.weatherDarkGray)
                    
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
    

}

#Preview {
    DayWeatherCard(maxTemp: 18.0, minTemp: 10.0, day: MockWeatherService.demoDay)
        .background(Color.weatherLightBlue)
}
