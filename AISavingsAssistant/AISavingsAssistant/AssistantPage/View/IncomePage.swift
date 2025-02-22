//
//  IncomePage.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//
import SwiftUI

struct IncomePage: View {
    @StateObject private var viewModel = AssistantViewModel()
    @State private var showSmartSavingPage = false
    @State private var isLoading = false
    @State private var isAnalyzing = false

    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Spacer()
                
                Image("income")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(25)
                Spacer()
                
                Text("Enter Your Monthly Income")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()

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
                    isLoading = true
                    isAnalyzing = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        viewModel.sendAmount()
                        isAnalyzing = false
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false
                            if viewModel.isSuccess {
                                showSmartSavingPage = true
                            }
                        }
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

                if isLoading {
                    VStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(1.5)
                        
                        if isAnalyzing {
                            Text("AI is analyzing your amount...")
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .padding(.top, 5)
                        } else {
                            Text("Amount submitted successfully!")
                                .foregroundColor(.green)
                                .padding(.top, 5)
                        }
                    }
                    .padding(.top, 10)
                } else {
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.top, 10)
                    }
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(CustomColors.homePageDark.ignoresSafeArea())
            .navigationBarBackButtonHidden(true)
            
            NavigationLink(
                destination: SmartSavingPage(assistantViewModel: viewModel, userIncome: Double(viewModel.amount) ?? 0),
                isActive: $showSmartSavingPage,
                label: { EmptyView() }
            )
        }
    }
}

#Preview {
    IncomePage()
}
