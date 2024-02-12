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
    @State var sizeOpacityScale: CGFloat = 1
    
    // Used to identify the max size for the geometry reader. Use this value to then update the `sizeOpacityScale` State variable
    @State var maxSize: CGFloat? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            // Search Bar
            WeatherTextField(searchText: $searchText)
                .accessibilityIdentifier("weatherSearchtextField")
                .padding(.top, 5)
            
            // Main Content
            if weatherManager.isLoading {
                LoadingView()
            } else {
                if let forecastedWeather = weatherManager.forecastedWeather {
                    Text("Weather in \(forecastedWeather.location.name)")
                        .accessibilityIdentifier("titleText")
                        .modifier(BoldText())
                        .padding([.top, .horizontal])
                        .padding(.bottom, 6)
                    
                    Text("\(forecastedWeather.location.region), \(forecastedWeather.location.country)")
                        .accessibilityIdentifier("titleText")
                        .modifier(SemiboldText(fontSize: 14))
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                    
                    Text(forecastedWeather.current.temp_f.getTempAttributedString(isFarenheit: true))
                        .foregroundStyle(.white)
                    
                    let size = sizeOpacityScale > 0 ? (sizeOpacityScale < 1 ? sizeOpacityScale * 64 : 64) : 0
                    WeatherAsyncImage(imageUrl: forecastedWeather.current.condition.iconUrl, width: size, height: size)
                        .shadow(radius: 10)
                        .opacity(sizeOpacityScale)
                    
                    Text(forecastedWeather.current.condition.text)
                        .modifier(SemiboldText(fontSize: 11))
                        .opacity(sizeOpacityScale)
                        .padding(3)
                    
                    if let firstDay = forecastedWeather.forecast.forecastday.first {
                        Text("Min: \(firstDay.day.mintemp_f.getTempString()) /  Max: \(firstDay.day.maxtemp_f.getTempString())")
                            .modifier(SemiboldText(fontSize: 11))
                            .opacity(sizeOpacityScale)
                    }
                    ScrollView {
                        if let firstDay = forecastedWeather.forecast.forecastday.first {
                            ZStack {
                                // Geometry Reader to calculate opacity and sizing scale for texts
                                GeometryReader { g -> AnyView in
                                    let rect = g.frame(in: .global)
                                    DispatchQueue.main.async {
                                        guard let maxSize = self.maxSize else {
                                            self.maxSize = rect.maxY
                                            return
                                        }
                                        self.sizeOpacityScale = (g.size.height - (maxSize - rect.maxY)) / g.size.height
                                        
                                    }
                                    return AnyView(
                                        RoundedRectangle(cornerRadius: 0).foregroundStyle(Color.clear)
                                    )
                                }
                                
                                // Hourly Forecast View
                                HomeHourlyForecastView(firstDay: firstDay)
                                    .background(Color.weatherLightBlue.opacity(0.2))
                                    .clipShape(RoundedRectangle(cornerRadius: 8.0))
                                    .clipped()
                                    .padding()
                            }
                        }
                        
                        // Daily Forecast View
                        HomeDailyForecastView(forecast: forecastedWeather.forecast)
                            .background(Color.weatherLightBlue.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 8.0))
                            .clipped()
                            .padding()
                    }
                    .padding(.top, 6)
                }
                else if let error = weatherManager.error {
                    ErrorView(systemIcon: "xmark.circle", errorMessage: error.userMessage)
                }
            }
        }
        .background(Color.weatherBlue)
    }
}

#Preview {
    HomeView(searchText: "Chanhassen")
        .environmentObject({ () -> WeatherManager in
                           let envObj = WeatherManager(service: MockWeatherService(forceError: false))
                           envObj.forecastedWeather = MockWeatherService.mockForecastResponse
                           envObj.currentWeather = MockWeatherService.mockCurrentWeatherResponse
                           return envObj
                       }())
}
