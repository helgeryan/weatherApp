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
            TextField("Enter a location", text: $searchText)
                .fixedSize()
            
            Button {
                Task {
                    await weatherManager.refresh(with: searchText)
                }
            } label: {
                Text("Enter")
            }
            
            if let response = weatherManager.currentWeather {
                Text("Weather in \(response.location.name)")
                
                Text("\(response.current.temp_f)oF")
                
                AsyncImage(url: URL(string: "https://cdn.weatherapi.com/weather/64x64/night/302.png"), content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                }, placeholder: {
                    ProgressView()
                })
                .frame(width: 64, height: 64)
                
                
            }
            
        }
    }
}
