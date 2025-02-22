//
//  LoginViewModel.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//


import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var rememberMe: Bool = false
    @Published var navigateToContent: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    var isLoginEnabled: Bool {
        !email.isEmpty && !password.isEmpty && rememberMe
    }

    func login() {
        guard isLoginEnabled else { return }
        
        let url = URL(string: "http://127.0.0.1:8000/api/login/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let user = UserModel(email: email, password: password)
        guard let jsonData = try? JSONEncoder().encode(user) else { return }
        request.httpBody = jsonData
        
        print("🔵 Initiating login request to: \(url)")
        print("🟡 Sending request with body: \(String(data: jsonData, encoding: .utf8) ?? "")")
        
        isLoading = true
        errorMessage = nil
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.errorMessage = "❌ Network error: \(error.localizedDescription)"
                    print(self.errorMessage!)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    self.errorMessage = "❌ Invalid response from server."
                    print(self.errorMessage!)
                    return
                }
                
                print("🟢 Received HTTP response: \(httpResponse.statusCode)")
                
                if httpResponse.statusCode == 200 {
                    self.handleLoginResponse(data: data)
                    self.navigateToContent = true
                    print("✅ Login successful!")
                } else {
                    self.errorMessage = "❌ Login failed: HTTP Status \(httpResponse.statusCode)"
                    print(self.errorMessage!)
                }
            }
        }.resume()
    }

    private func handleLoginResponse(data: Data?) {
        guard let data = data else {
            self.errorMessage = "❌ No data received"
            return
        }
        
        do {
            let response = try JSONDecoder().decode(LoginResponse.self, from: data)
            UserDefaults.standard.set(response.access, forKey: "accessToken")
            print("🔑 Token saved to UserDefaults: \(response.access)")
        } catch {
            self.errorMessage = "❌ Failed to decode response: \(error.localizedDescription)"
            print(self.errorMessage!)
        }
    }
}
