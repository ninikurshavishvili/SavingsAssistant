//
//  AssistantPage.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//


import SwiftUI

struct AssistantPage: View {
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
                
                NavigationLink(destination: IncomePage()) {
                    Text("Get Started →")
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
        }
    }
}





