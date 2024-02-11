//
//  HomeDayView.swift
//  weather
//
//  Created by Ryan Helgeson on 2/11/24.
//

import SwiftUI

struct HomeDailyForecastView: View {
    let forecast: Forecast
    var body: some View {
        VStack(spacing: 0) {
            SectionHeaderView(systemImage: "calendar", headerText: "\(Constants.forecastDays)-DAY FORECAST")
            let maxTempF = forecast.getMaxTempF()
            let minTempF = forecast.getMinTempF()
            ForEach(forecast.forecastday, id: \.self) { day in
                Divider()
                    .foregroundStyle(Color.weatherDarkGray)
                    .padding(.horizontal)
                DayWeatherCard(maxTemp: maxTempF, minTemp: minTempF, day: day)
                    .padding(.horizontal)
                
            }
        }
    }
}

