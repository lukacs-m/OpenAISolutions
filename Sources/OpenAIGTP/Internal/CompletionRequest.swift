//
//  CompletionRequest.swift
//  
//
//  Created by Martin Lukacs on 18/02/2023.
//

import Foundation

struct CompletionRequest: Codable {
    let model: String
    let prompt: String
    let temperature: Double
    let maxTokens: Int
    let topP: Double
    let frequencyPenalty: Double
    let presencePenalty: Double
    let stop: String?
    
    enum CodingKeys: String, CodingKey {
        case model, prompt, temperature, stop
        case maxTokens = "max_tokens"
        case topP = "top_p"
        case frequencyPenalty = "frequency_penalty"
        case presencePenalty = "presence_penalty"
    }
}
