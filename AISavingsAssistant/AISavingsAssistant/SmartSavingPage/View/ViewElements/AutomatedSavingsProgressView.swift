//
//  AutomatedSavingsProgressView.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//

import SwiftUI

struct AutomatedSavingsProgressView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "chart.bar.fill")
                    .foregroundColor(.blue)
                Text("Automated Savings Progress")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
            }

            Text("🎯 You've saved 20% of your goal this month!")
                .font(.body)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .padding(.vertical, 5)

            Divider()
                .background(Color.gray.opacity(0.4))

            HStack {
                Text("View Progress Report")
                    .foregroundColor(.white)
                Image(systemName: "arrow.right")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.secondary.opacity(0.8))
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

