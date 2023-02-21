//
//  APIConfiguration+Extensions.swift
//  
//
//  Created by Martin Lukacs on 17/02/2023.
//

import Foundation
import OpenAIClient

// MARK: - API endpoints

extension APIConfiguration {
    enum EndPoints {
        static let completions = "/v1/completions"
        static let edits = "v1/edits"
    }
}
