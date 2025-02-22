//
//  SpendingCategory.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//


import SwiftUI

struct SpendingCategory: Identifiable, Codable {
    let id: String
    let name: String
    let percentage: Double
    let color: String
    let iconName: String

    enum CodingKeys: String, CodingKey {
        case id, name, percentage, color = "colorName", iconName
    }

    var uiColor: Color {
        switch color.lowercased() {
        case "color1": return CustomColors.color1
        case "color2": return CustomColors.color2
        case "color3": return CustomColors.color3
        case "color4": return CustomColors.color4
        case "color5": return CustomColors.color5
        default: return .black
        }
    }
}



