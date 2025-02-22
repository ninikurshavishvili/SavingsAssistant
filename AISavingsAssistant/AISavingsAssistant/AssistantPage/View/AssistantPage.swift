//
//  AssistantPage.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//


import SwiftUI

struct AssistantPage: View {
    @StateObject private var viewModel = AssistantViewModel()
    @State private var showSmartSavingPage = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                Image("Assistant")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(25)

                Spacer()

                VStack(spacing: 8) {
                    Text("Meet Your Banking Assistant")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)

                    Text("Your personal banking assistant to help you manage your savings effortlessly.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                }

                Spacer()

                TextField("Enter Amount", text: $viewModel.amount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 30)

                Button(action: {
                    viewModel.sendAmount()
                    if viewModel.isSuccess {
                        showSmartSavingPage = true
                    }
                }) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.amount.isEmpty ? Color.gray : CustomColors.buttonBlue)
                        .cornerRadius(12)
                        .padding(.horizontal, 30)
                }
                .disabled(viewModel.amount.isEmpty)

                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }

                if viewModel.isSuccess {
                    Text("Amount submitted successfully!")
                        .foregroundColor(.green)
                        .padding(.top, 10)
                }

                Spacer()

                NavigationLink(
                    destination: SmartSavingPage(userIncome: Double(viewModel.amount) ?? 0),
                    isActive: $showSmartSavingPage,
                    label: { EmptyView() }
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(CustomColors.homePageDark.ignoresSafeArea())
        }
    }
}



