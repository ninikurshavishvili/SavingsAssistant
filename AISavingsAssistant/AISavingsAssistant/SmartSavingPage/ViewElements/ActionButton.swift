//
//  ActionButton.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//
import SwiftUI

struct ActionButton: View {
    let title: String
    let color: Color
    
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(12)
    }
}
