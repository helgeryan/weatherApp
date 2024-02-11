//
//  WeatherAsyncImage.swift
//  weather
//
//  Created by Ryan Helgeson on 2/10/24.
//

import SwiftUI

struct WeatherAsyncImage: View {
    var imageUrl: URL? = URL(string: "https://cdn.weatherapi.com/weather/64x64/night/302.png")
    var width: CGFloat = 64.0
    var height: CGFloat = 64.0
    var body: some View {
        AsyncImage(url: imageUrl, content: { image in
            image
                .resizable()
                .scaledToFit()
        }, placeholder: {
            ProgressView()
        })
        .frame(width: width, height: height)
    }
}

#Preview {
    WeatherAsyncImage()
}
