//
//  SavingsRecommendationsView.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//

import SwiftUI

struct SavingsRecommendationsView: View {
    @ObservedObject var viewModel: AssistantViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                Text("Savings Recommendations")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
            }

            if let spendingPlan = viewModel.spendingPlan {
                Text(spendingPlan)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
            }

            Divider()
                .background(Color.gray.opacity(0.4))

            HStack {
                Text("View More Tips")
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

