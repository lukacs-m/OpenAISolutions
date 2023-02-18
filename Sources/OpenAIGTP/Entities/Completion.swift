//
//  Completion.swift
//  
//
//  Created by Martin Lukacs on 18/02/2023.
//

import Foundation

// MARK: - Completion
public struct Completion: Codable {
    public let id, object: String
    public let created: Int
    public let model: String
    public let choices: [Choice]
    public let usage: Usage
    
    public init(id: String, object: String, created: Int, model: String, choices: [Choice], usage: Usage) {
        self.id = id
        self.object = object
        self.created = created
        self.model = model
        self.choices = choices
        self.usage = usage
    }
}

// MARK: - Choice
public struct Choice: Codable, Equatable {
    public let text: String
    public let index: Int
    public let finishReason: String
    
    enum CodingKeys: String, CodingKey {
        case text, index
        case finishReason = "finish_reason"
    }
    
    public init(text: String, index: Int, finishReason: String) {
        self.text = text
        self.index = index
        self.finishReason = finishReason
    }
    
    public static func == (lhs: Choice, rhs: Choice) -> Bool {
        return lhs.text == rhs.text &&
        lhs.index == rhs.index &&
        lhs.finishReason == rhs.finishReason
    }
}

// MARK: - Usage
public struct Usage: Codable {

    public let promptTokens, completionTokens, totalTokens: Int
    
    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
    
    public init(promptTokens: Int, completionTokens: Int, totalTokens: Int) {
        self.promptTokens = promptTokens
        self.completionTokens = completionTokens
        self.totalTokens = totalTokens
    }
}
