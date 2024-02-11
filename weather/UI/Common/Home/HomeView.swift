//
//  HomeView.swift
//  weather
//
//  Created by Ryan Helgeson on 2/8/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var weatherManager: WeatherManager
    @State var searchText: String = "Chanhassen"
    var body: some View {
        VStack {
            WeatherTextField(searchText: $searchText)
            
            ScrollView {
                if let response = weatherManager.forecastedWeather {
                    Text("Weather in \(response.location.name)")
                        .modifier(BoldText())
                    
                    Text(getAttributedString(forecast: response))
                        .modifier(BoldText(fontSize: 30))
                    
                    WeatherAsyncImage()
                    
                    if let firstDay = response.forecast.forecastday.first {
                        
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
                        .background(Color.weatherLightBlue.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                        .clipped()
                        .padding()
                    }
                    
                    VStack(spacing: 0) {
                        SectionHeaderView(systemImage: "calendar", headerText: "5-DAY FORECAST")
                        
                        ForEach(response.forecast.forecastday, id: \.self) { day in
                            Divider()
                                .foregroundStyle(Color.darkGray)
                                .padding(.horizontal)
                            DayWeatherCard(day: day)
                                .padding(.horizontal)
                            
                        }
                    }
                    .background(Color.weatherLightBlue.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 8.0))
                    .clipped()
                    .padding()
                }
                
            }
        }
        .background(Color.weatherBlue)
    }
    
    func getAttributedString(forecast: ForecastResponse) -> AttributedString {
        let valueString = String(format: "%d\(Constants.degrees)", Int(forecast.current.temp_f))
        var string: AttributedString = AttributedString(valueString)
        string.font = .systemFont(ofSize: 30, weight: .bold)
        
        var string2: AttributedString = AttributedString("F")
        string2.font = .systemFont(ofSize: 22, weight: .bold)
        
        return string + string2
    }
}

#Preview {
    HomeView(searchText: "London")
        .environmentObject(WeatherManager(service: WeatherAPIService()))
}
