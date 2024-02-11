//
//  HomeView.swift
//  weather
//
//  Created by Ryan Helgeson on 2/8/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var weatherManager: WeatherManager
    @State var searchText: String = ""
    var body: some View {
        VStack {
            HStack {
                TextField("Enter a location", text: $searchText)
                    .fixedSize()
                
                
                Button {
                    Task {
                        await weatherManager.refresh(with: searchText)
                    }
                } label: {
                    Text("Enter")
                }
            }
            
            ScrollView {
                if let response = weatherManager.forecastedWeather {
                    Text("Weather in \(response.location.name)")
                        .modifier(BoldText())
                    
                    Text(getAttributedString(forecast: response))
                        .modifier(BoldText(fontSize: 30))
                    
                    WeatherAsyncImage()
                    
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(Color.darkGray)
                                .frame(width: 20, height: 20)
                                .padding()
                            Text("5-DAY FORECAST")
                                .modifier(RegularText(fontSize: 11, textColor: Color.darkGray))
                            Spacer()
                        }
                        
                        ForEach(response.forecast.forecastday, id: \.self) { day in
                            Divider()
                                .padding(.horizontal)
                            DayWeatherCard(day: day.day)
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
