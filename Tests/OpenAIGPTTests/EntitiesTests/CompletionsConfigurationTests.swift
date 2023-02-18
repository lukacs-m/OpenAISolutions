//
//  CompletionsConfigurationTests.swift
//  
//
//  Created by Martin Lukacs on 18/02/2023.
//

import Foundation
import XCTest
import OpenAIGTP

class CompletionsConfigurationTests: XCTestCase {
    
    func testDefaultValues() {
        let defaultConfig = CompletionsConfiguration.default
        
        XCTAssertEqual(defaultConfig.model, "text-davinci-003")
        XCTAssertEqual(defaultConfig.maxTokens, 16)
        XCTAssertEqual(defaultConfig.temperature, 1.0)
        XCTAssertEqual(defaultConfig.topP, 1.0)
        XCTAssertEqual(defaultConfig.frequencyPenalty, 0)
        XCTAssertEqual(defaultConfig.presencePenalty, 0)
        XCTAssertNil(defaultConfig.stop)
    }
}
