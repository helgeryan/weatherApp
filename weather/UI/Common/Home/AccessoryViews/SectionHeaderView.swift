//
//  SectionHeaderView.swift
//  weather
//
//  Created by Ryan Helgeson on 2/11/24.
//

import SwiftUI

struct SectionHeaderView: View {
    var systemImage: String
    var headerText: String
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: systemImage)
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.darkGray)
                .frame(width: 20, height: 20)
                .padding()
            Text(headerText)
                .modifier(RegularText(fontSize: 11, textColor: Color.darkGray))
            Spacer()
        }
    }
}

#Preview {
    SectionHeaderView(systemImage: "clock", headerText: "HOURLY FORECAST")
}
