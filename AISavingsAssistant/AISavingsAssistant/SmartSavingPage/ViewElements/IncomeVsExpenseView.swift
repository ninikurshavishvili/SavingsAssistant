//
//  IncomeVsExpenseView.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//

import SwiftUI

struct IncomeVsExpenseView: View {
    let income: Double
    let expenses: Double = 8_900
    let percentageChange: Double = -3.2

    var balance: Double {
        income
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "creditcard.fill")
                    .foregroundColor(.purple)
                Text("Income vs. Expenses")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
            }

            Text("\(String(format: "%.2f", balance))")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)

            HStack {
                Image(systemName: percentageChange < 0 ? "arrow.down.right" : "arrow.up.right")
                    .foregroundColor(percentageChange < 0 ? .red : .green)

                Text("\(String(format: "%.1f", abs(percentageChange)))%")
                    .foregroundColor(percentageChange < 0 ? .red : .green)
                    .bold()

                Text("compared to last month")
                    .foregroundColor(.gray)
            }

            Divider()
                .background(Color.gray.opacity(0.4))

            HStack {
                Text("View Report")
                    .foregroundColor(.white)
                Image(systemName: "arrow.right")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.secondary.opacity(0.8))
        .padding(.horizontal)
    }
}


