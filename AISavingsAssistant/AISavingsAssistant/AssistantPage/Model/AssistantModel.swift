//
//  AssistantModel.swift
//  AISavingsAssistant
//
//  Created by Nino Kurshavishvili on 22.02.25.
//


struct AssistantModel: Codable {
    let amount: Double
}

struct AssistantResponse: Codable {
    var spending_plan: String
}
