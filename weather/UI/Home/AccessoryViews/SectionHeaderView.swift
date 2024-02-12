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
                .foregroundStyle(Color.white)
                .frame(width: 20, height: 20)
                .padding([.vertical, .leading])
                .padding(.trailing, 6)
            Text(headerText)
                .modifier(SemiboldText(fontSize: 11, textColor: Color.white))
            Spacer()
        }
    }
}

#Preview {
    SectionHeaderView(systemImage: "clock", headerText: "HOURLY FORECAST")
}
