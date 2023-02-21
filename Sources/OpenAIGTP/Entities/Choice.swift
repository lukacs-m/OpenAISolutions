//
//  Choice.swift
//  
//
//  Created by Martin Lukacs on 20/02/2023.
//

import Foundation

// MARK: - Choice
public struct Choice: Codable, Equatable {
    public let text: String
    public let index: Int
    public let finishReason: String?
    
    enum CodingKeys: String, CodingKey {
        case text, index
        case finishReason = "finish_reason"
    }
    
    public init(text: String, index: Int, finishReason: String?) {
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
