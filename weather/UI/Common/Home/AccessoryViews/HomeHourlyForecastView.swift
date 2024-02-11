//
//  HomeHourView.swift
//  weather
//
//  Created by Ryan Helgeson on 2/11/24.
//

import SwiftUI

struct HomeHourlyForecastView: View {
    let firstDay: ForecastDay
    var body: some View {
        VStack(spacing: 0) {
            SectionHeaderView(systemImage: "clock", headerText: "HOURLY FORECAST")
            Divider()
                .padding(.horizontal)
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(firstDay.hour, id: \.self) { hour in
                        HourWeatherCard(hour: hour)
                    }
                }
            }
        }
    }
}
