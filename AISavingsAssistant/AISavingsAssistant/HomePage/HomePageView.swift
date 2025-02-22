//
//  HomePageView.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//

import SwiftUI

struct HomePageView: View {
    @Binding var navigateToAssistant: Bool
    
    var body: some View {
        ZStack {
            CustomColors.homePageDark
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                FeatureCard(navigateToAssistant: $navigateToAssistant)
                
                Spacer()
                
                NavigationLink("", destination: AssistantPage(), isActive: $navigateToAssistant)
            }
            .navigationTitle("მთავარი")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("მთავარი")
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
            .navigationBarHidden(false)
        }
    }
}


