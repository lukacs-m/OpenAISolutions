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
    
    var informations: [String: Any] {
        [
            "model": model,
            "prompt": prompt,
            "temperature": temperature,
            "max_tokens": maxTokens,
            "top_p": topP,
            "frequency_penalty": frequencyPenalty,
            "presence_penalty": presencePenalty,
            "stop": stop as Any
        ]
    }
}
