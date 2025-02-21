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
                            Button(action: {
                                if item == "Savings Assistant" {
                                    navigateToAssistant = true
                                }
                                withAnimation {
                                    showMenu.toggle()
                                }
                            }) {
                                MenuItem(title: item)
                            }

                            if item == "ჩემი ფინანსები" {
                                Divider().padding(.horizontal)
                                    .background(Color.gray)
                                    .frame(height: 0.5)
                            }
                        }
                    }
                    .padding(.vertical, 10)
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

}

