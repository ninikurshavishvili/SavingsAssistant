//
//  ContentView.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var navigateToAssistant = false
    
    var body: some View {
        ZStack {
            NavigationView {
                HomePageView(navigateToAssistant: $navigateToAssistant)
                    .navigationBarItems(leading: Button(action: {
                        withAnimation {
                            showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.white)
                    })
            }
            
            if showMenu {
                SideMenuView(showMenu: $showMenu, navigateToAssistant: $navigateToAssistant)
            }
        }
    }
}
