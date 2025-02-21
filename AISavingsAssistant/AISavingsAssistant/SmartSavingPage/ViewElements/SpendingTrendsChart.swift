//
//  SpendingTrendsChart.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//

import SwiftUI
import Charts

struct SpendingTrendsChart: View {
    @ObservedObject var viewModel: SpendingViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Spending Trends")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.horizontal)

            Chart(viewModel.spendings) { category in
                SectorMark(
                    angle: .value("Amount", max(category.percentage, 2)),
                    innerRadius: .ratio(0.55),
                    outerRadius: .ratio(1)
                )
                .foregroundStyle(category.uiColor)
                .annotation(position: .overlay) {
                    if category.percentage > 10 {
                        Image(systemName: category.iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(height: 200)
            .padding(.horizontal)

            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2), spacing: 5) {
                ForEach(viewModel.spendings) { category in
                    HStack {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(category.uiColor)
                        Text("\(category.name) - \(Int(category.percentage))%")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .background(Color.secondary.opacity(0.8))
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal)
        .padding(.bottom)
    }
}






