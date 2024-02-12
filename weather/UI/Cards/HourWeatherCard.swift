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
            Text(hour.time_epoch.getEpochToHourText())
                .modifier(BoldText(fontSize: 12))
                .padding(.top)
            
            WeatherAsyncImage(imageUrl: hour.condition.iconUrl, width: 40, height: 40)
                .padding(.horizontal)
                .shadow(radius: 10.0)
            
            
            Text("\(hour.chanceOfPrecipitation)% PPT")
                .modifier(BoldText(fontSize: 10))
                .padding(.vertical, 5)
            
            Text(hour.temp_f.getTempString())
                .modifier(BoldText(fontSize: 12))
                .padding(.bottom)
        }
    }
    

}

#Preview {
    HourWeatherCard(hour: MockWeatherService.mockHour)
        .background(Color.blue)
}
