//
//  MenuItem.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//


import SwiftUI

struct MenuItem: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 8)
    }
}
