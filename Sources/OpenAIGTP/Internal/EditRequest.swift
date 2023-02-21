//
//  EditRequest.swift
//  
//
//  Created by Martin Lukacs on 20/02/2023.
//

import Foundation

struct EditRequest: Codable {
    let model: String
    let input: String
    let instruction: String
    let temperature: Double
    let topP: Double
    
    enum CodingKeys: String, CodingKey {
        case model, input, instruction, temperature
        case topP = "top_p"
    }
}
