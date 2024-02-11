//
//  BoldText.swift
//  weather
//
//  Created by Ryan Helgeson on 2/10/24.
//

import SwiftUI

struct BoldText: ViewModifier {
    var fontSize: CGFloat = 18.0
    var textColor: Color = .white
    func body(content: Content) -> some View {
        content
            .foregroundStyle(textColor)
            .font(.system(size: fontSize, weight: .bold))
    }
}
