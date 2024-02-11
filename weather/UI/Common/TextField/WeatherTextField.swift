//
//  WeatherTextField.swift
//  weather
//
//  Created by Ryan Helgeson on 2/11/24.
//

import SwiftUI

struct WeatherTextField: View {
    @EnvironmentObject var weatherManager: WeatherManager
    @Binding var searchText: String
    var body: some View {
        HStack(spacing: 0) {
            TextField("Enter a location (name or zip)", text: $searchText)
                .modifier(RegularText())
                .padding(.horizontal)
                .fixedSize()
                .onSubmit {
                    submitSearch()
                }
            
            Divider()
                .foregroundStyle(Color.weatherDarkGray)
            
            Button {
                submitSearch()
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(Color.weatherDarkGray)
                    .padding(8)
            }
        }
        .background(Color.weatherLightBlue.opacity(0.2))
        .clipped()
        .clipShape(Capsule())
        .fixedSize(horizontal: true, vertical: true)
    }
    
    func submitSearch() {
        Task {
            await weatherManager.refresh(with: searchText)
        }
    }
}
