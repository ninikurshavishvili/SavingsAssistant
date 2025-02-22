//
//  AssistantViewModel.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 22.02.25.
//


import SwiftUI

class AssistantViewModel: ObservableObject {
    @Published var amount: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var isSuccess: Bool = false
    @Published var spendingPlan: String?

    func sendAmount() {
        guard let amountValue = Double(amount), amountValue > 0 else {
            errorMessage = "Please enter a valid amount"
            print("❌ Invalid amount: \(amount)")
            return
        }

        guard let accessToken = UserDefaults.standard.string(forKey: "accessToken") else {
            errorMessage = "Authentication error: No access token found"
            print("❌ No access token found")
            return
        }

        let url = URL(string: "http://127.0.0.1:8000/api/assistant/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

        let assistantData = AssistantModel(amount: amountValue)
        
        do {
            let jsonData = try JSONEncoder().encode(assistantData)
            request.httpBody = jsonData
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("📤 Sending request to \(url)")
                print("📄 Request body: \(jsonString)")
            }
        } catch {
            print("❌ Failed to encode JSON: \(error.localizedDescription)")
            return
        }

        isLoading = true
        errorMessage = nil

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false

                if let error = error {
                    self.errorMessage = "Network error: \(error.localizedDescription)"
                    print("❌ Network error: \(error.localizedDescription)")
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    self.errorMessage = "Invalid response from server."
                    print("❌ Invalid response from server")
                    return
                }

                print("🟢 Received HTTP response: \(httpResponse.statusCode)")

                if let data = data {
                    do {
                        let decodedResponse = try JSONDecoder().decode(AssistantResponse.self, from: data)
                        self.spendingPlan = decodedResponse.spending_plan
                        print("📥 Response: \(self.spendingPlan ?? "No spending plan")")
                    } catch {
                        self.errorMessage = "Failed to decode response: \(error.localizedDescription)"
                        print("❌ Failed to decode response: \(error.localizedDescription)")
                    }
                }

                if httpResponse.statusCode == 200 {
                    self.isSuccess = true
                    print("✅ Amount submitted successfully!")
                } else {
                    self.errorMessage = "Failed to submit amount. HTTP Status: \(httpResponse.statusCode)"
                    print("❌ Failed to submit amount. HTTP Status: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }
}
