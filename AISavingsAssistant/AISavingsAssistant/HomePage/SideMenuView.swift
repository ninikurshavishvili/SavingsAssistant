//
//  SideMenuView.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//


import SwiftUI

struct SideMenuView: View {
    @Binding var showMenu: Bool
    @Binding var navigateToAssistant: Bool
    @State private var isNavigatingToSmartSavings = false
    
    let menuItems = [
        "ჩემი პროდუქტები", "ინვესტიციები", "გადარიცხვები",
        "პარკირება და ჯარიმები", "ტრანზაქციები", "ჩემი ფინანსები",
        "ერთგულების პროგრამა", "პროდუქტების აქტივაცია",
        "ჩემი განვადებები", "შეტყობინებები", "ვალუტის კურსები", "Savings Assistant"
    ]
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        showMenu.toggle()
                    }
                }
            
            VStack(alignment: .leading) {
                Text("მთავარი")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColors.buttonBlue)
                    .padding(.top, 50)
                    .padding(.leading, 20)
                    .padding(.bottom, 5)
                
                Divider()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(menuItems, id: \.self) { item in
                            menuButton(for: item)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.leading, 10)
                }
                
                Divider()
                
                Button(action: {
                    withAnimation {
                        showMenu.toggle()
                    }
                }) {
                    Text("გამოსვლა")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(CustomColors.buttonBlue)
                        .cornerRadius(25)
                        .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .frame(width: 280)
            .background(CustomColors.menuBarBackground)
            .offset(x: 0)
        }
    }
    
    @ViewBuilder
    private func menuButton(for item: String) -> some View {
        Button(action: {
            if item == "Savings Assistant" {
                navigateToAssistant = true
            }
            withAnimation {
                showMenu.toggle()
            }
        }) {
            Text(item)
                .foregroundColor(item == "Savings Assistant" ? CustomColors.color4 : .white)
                .fontWeight(item == "Savings Assistant" ? .bold : .regular)
                .padding(.vertical, 5)
        }
        
        if item == "ჩემი ფინანსები" {
            Divider()
                .background(Color.gray.opacity(0.5))
                .padding(.horizontal)
                .frame(height: 0.5)
        }
    }
}

