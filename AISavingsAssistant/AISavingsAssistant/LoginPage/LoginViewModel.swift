//
//  LoginViewModel.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//


import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var rememberMe: Bool = false
    @Published var navigateToContent: Bool = false
    
    var isLoginEnabled: Bool {
        !username.isEmpty && !password.isEmpty
    }
    
    func login() {
        if isLoginEnabled {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.navigateToContent = true
            }
        }
    }
}
