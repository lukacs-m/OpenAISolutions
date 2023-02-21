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
