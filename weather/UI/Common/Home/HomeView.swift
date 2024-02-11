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
    @State var maxSize: CGFloat? = nil
    var body: some View {
        VStack(spacing: 0) {
            WeatherTextField(searchText: $searchText)
                .padding(.top, 5)
            
            if let forecastedWeather = weatherManager.forecastedWeather {
                Text("Weather in \(forecastedWeather.location.name)")
                    .modifier(BoldText())
                    .padding([.top, .horizontal])
                    .padding(.bottom, 8)
                
                Text(forecastedWeather.current.temp_f.getTempAttributedString(isFarenheit: true))
                    .modifier(BoldText(fontSize: 30))
                
                let size = sizeOpacityScale > 0 ? (sizeOpacityScale < 1 ? sizeOpacityScale * 64 : 64) : 0
                WeatherAsyncImage(imageUrl: forecastedWeather.current.condition.iconUrl, width: size, height: size)
                    .shadow(radius: 10)
                    .opacity(sizeOpacityScale)
                
                
                if let firstDay = forecastedWeather.forecast.forecastday.first {
                    Text("Min: \(firstDay.day.mintemp_f.getTempString()) /  Max: \(firstDay.day.maxtemp_f.getTempString())")
                        .modifier(SemiboldText(fontSize: 11))
                        .opacity(sizeOpacityScale)
                }
                ScrollView {
                    if let firstDay = forecastedWeather.forecast.forecastday.first {
                        ZStack {
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
                            HomeHourlyForecastView(firstDay: firstDay)
                                .background(Color.weatherLightBlue.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 8.0))
                                .clipped()
                                .padding()
                        }
                    }
                    HomeDailyForecastView(forecast: forecastedWeather.forecast)
                        .background(Color.weatherLightBlue.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                        .clipped()
                        .padding()
                }
                .padding(.top, 6)
            }
        }
        .background(Color.weatherBlue)
    }
}

#Preview {
    HomeView(searchText: "London")
        .environmentObject(WeatherManager(service: WeatherAPIService()))
}
