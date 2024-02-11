//
//  SemiboldText.swift
//  weather
//
//  Created by Ryan Helgeson on 2/11/24.
//

import SwiftUI

struct SemiboldText: ViewModifier {
    var fontSize: CGFloat = 14.0
    var textColor: Color = .white
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize, weight: .semibold))
            .foregroundStyle(textColor)
    }
}
