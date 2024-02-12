//
//  LoadingView.swift
//  weather
//
//  Created by Ryan Helgeson on 2/12/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.weatherBlue
            VStack {
                ProgressView()
                Text("Loading weather...")
                    .modifier(SemiboldText(fontSize: 20))
                    .foregroundStyle(.white)
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}
