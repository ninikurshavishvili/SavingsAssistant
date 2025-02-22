//
//  IncomePage.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//

import SwiftUI

struct IncomePage: View {
    @State private var userIncome: String = ""
    @State private var showAlert: Bool = false
    @State private var navigateToNextPage: Bool = false

    var body: some View {
        VStack {
            Spacer()
            
            Image("income")
                .resizable()
                .scaledToFit()
                .frame(height: 250)
                .cornerRadius(25)
            
            Spacer()
            
            VStack(spacing: 8) {
                Text("Enter Your Monthly Income")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                TextField("e.g. 5000", text: $userIncome)
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 30)
            }
            
            Spacer()
            
            Button(action: {
                showAlert = true
            }) {
                Text("Analyze with AI")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(CustomColors.buttonBlue)
                    .cornerRadius(12)
                    .padding(.horizontal, 30)
            }
            .alert("AI Processing Consent", isPresented: $showAlert) {
                Button("Don't Allow", role: .cancel) {}
                Button("Allow") {
                    navigateToNextPage = true
                }
            } message: {
                Text("Your data will be processed by AI. Do you want to continue?")
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(CustomColors.homePageDark.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .background(
            NavigationLink(destination: SmartSavingPage(userIncome: Double(userIncome) ?? 0.0),
                           isActive: $navigateToNextPage) { EmptyView() }
        )
    }
}


