//
//  RegularText.swift
//  weather
//
//  Created by Ryan Helgeson on 2/10/24.
//

import Foundation
import SwiftUI

struct RegularText: ViewModifier {
    var fontSize: CGFloat = 14.0
    var textColor: Color = .white
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize, weight: .regular))
            .foregroundStyle(textColor)
    }
}
