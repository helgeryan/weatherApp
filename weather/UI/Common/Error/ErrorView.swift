//
//  ErrorView.swift
//  weather
//
//  Created by Ryan Helgeson on 2/12/24.
//

import SwiftUI

struct ErrorView: View {
    let systemIcon: String
    let errorMessage: String
    var body: some View {
        ZStack {
            Color.weatherBlue
            VStack {
                Image(systemName: systemIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.white)
                
                Text(errorMessage)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .modifier(BoldText(fontSize: 20))
                    .padding()
            }
            
        }
    }
}

#Preview {
    ErrorView(systemIcon: "xmark.circle", errorMessage: "Unable to find weather data for this location at this time. Please try again.")
}
