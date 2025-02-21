//
//  IncomePage.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//

import SwiftUI

struct IncomePage: View {
    @State private var userIncome: String = ""

    var body: some View {
        VStack {
            Spacer()
            
            Text("Enter Your Monthly Income")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            TextField("e.g. 5000", text: $userIncome)
                .keyboardType(.numberPad)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.horizontal, 30)

            Spacer()
            
            NavigationLink(destination: SmartSavingPage(userIncome: Double(userIncome) ?? 0.0)) {
                Text("Analyze with AI")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(CustomColors.buttonBlue)
                    .cornerRadius(12)
                    .padding(.horizontal, 30)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(CustomColors.homePageDark.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
    }
}

