//
//  SmartSavingPage.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//

import SwiftUI

struct SmartSavingPage: View {
    @StateObject private var viewModel = SpendingViewModel()
    let userIncome: Double

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                SpendingTrendsChart(viewModel: viewModel)
                    .frame(height: 400)
                    .cornerRadius(25)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                
                IncomeVsExpenseView(income: userIncome)
                    .frame(height: 150)
                    .cornerRadius(25)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                
                SavingsRecommendationsView()
                    .cornerRadius(25)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                
                AutomatedSavingsProgressView()
                    .cornerRadius(25)
                    .shadow(radius: 5)
                    .padding(.horizontal)
            }
            .padding(.bottom, 20)
        }
        .navigationBarBackButtonHidden(true)
        .background(CustomColors.homePageDark.ignoresSafeArea())
    }
}








