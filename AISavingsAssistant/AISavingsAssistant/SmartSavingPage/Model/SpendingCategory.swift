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
        case "blue": return .blue
        case "green": return .green
        case "orange": return .orange
        case "red": return .red
        case "purple": return .purple
        case "yellow": return .yellow
        case "gray": return .gray
        default: return .black
        }
    }
}



