//
//  CustomColors.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//


import SwiftUI

struct CustomColors {
    static let buttonBlue = Color(hex: 0x02B2FE)
    static let homePageDark = Color(hex: 0x25292C)
    static let menuBarBackground = Color(hex: 0x313236)
    static let color1 = Color(hex: 0xbcd4fb) // Light Blue
    static let color2 = Color(hex: 0x7b93f3) // Medium Blue
    static let color3 = Color(hex: 0xfb7b6d) // Reddish-Pink
    static let color4 = Color(hex: 0x9188d5) // Purple
    static let color5 = Color(hex: 0xb69dc6) // Soft Purple
}

extension Color {
    init(hex: Int) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}
