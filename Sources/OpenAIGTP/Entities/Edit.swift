//
//  Edit.swift
//  
//
//  Created by Martin Lukacs on 20/02/2023.
//

import Foundation

// MARK: - Edit
public struct Edit: Codable {
    public let object: String
    public let created: Int
    public let choices: [Choice]
    public let usage: Usage
    
    public init(object: String, created: Int, choices: [Choice], usage: Usage) {
        self.object = object
        self.created = created
        self.choices = choices
        self.usage = usage
    }
}
