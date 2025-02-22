//
//  FeatureCard.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 22.02.25.
//

import SwiftUI

struct FeatureCard: View {
    @Binding var navigateToAssistant: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(spacing: 8) {
                Image(systemName: "sparkles")
                    .foregroundColor(.yellow)
                    .font(.title2)
                Text("ახალი ფუნქცია!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            Text("გაიცანით ")
                .font(.body)
                .foregroundColor(.white.opacity(0.8)) +
            Text("AI დანაზოგის ასისტენტი")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(CustomColors.color4) +
            Text(", რომელიც გეხმარებათ უკეთ მართოთ თქვენი ფინანსები და დაზოგოთ მეტი!")
                .font(.body)
                .foregroundColor(.white.opacity(0.8))
            
            Button(action: {
                withAnimation {
                    navigateToAssistant = true
                }
            }) {
                Text("გაიგე მეტი")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(CustomColors.color2)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(CustomColors.menuBarBackground)
                .shadow(radius: 5)
        )
        .padding(.horizontal, 20)
        .transition(.scale)
    }
}


