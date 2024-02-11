//
//  weatherApp.swift
//  weather
//
//  Created by Ryan Helgeson on 2/8/24.
//

import SwiftUI

@main
struct weatherApp: App {
    @StateObject var weatherManager: WeatherManager = .init(service: WeatherAPIService())
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(weatherManager)
                .onAppear {
                    Task {
                        await weatherManager.refresh(with: "Chanhassen")
                    }
                }
        }
    }
}
