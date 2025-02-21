//
//  SpendingViewModel.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 21.02.25.
//


import SwiftUI

class SpendingViewModel: ObservableObject {
    @Published var spendings: [SpendingCategory] = []

    init() {
        loadData()
    }

    func loadData() {
        if let url = Bundle.main.url(forResource: "spendingData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode([SpendingCategory].self, from: data)
                DispatchQueue.main.async {
                    self.spendings = decodedData
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("JSON file not found")
        }
    }
}

