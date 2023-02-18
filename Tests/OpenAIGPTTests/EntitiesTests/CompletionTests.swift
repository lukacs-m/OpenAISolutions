//
//  CompletionTests.swift
//  
//
//  Created by Martin Lukacs on 18/02/2023.
//

import XCTest
import OpenAIGTP

class CompletionTests: XCTestCase {
    
    func testCompletionVariablesArePublic() {
        let completion = Completion(id: "123", object: "object", created: 123456, model: "model", choices: [], usage: Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0))
        
        XCTAssertEqual(completion.id, "123")
        XCTAssertEqual(completion.object, "object")
        XCTAssertEqual(completion.created, 123456)
        XCTAssertEqual(completion.model, "model")
        XCTAssertEqual(completion.choices, [])
        XCTAssertEqual(completion.usage.promptTokens, 0)
        XCTAssertEqual(completion.usage.completionTokens, 0)
        XCTAssertEqual(completion.usage.totalTokens, 0)
    }
    
    func testChoiceVariablesArePublic() {
        let choice = Choice(text: "text", index: 0, finishReason: "finish reason")
        
        XCTAssertEqual(choice.text, "text")
        XCTAssertEqual(choice.index, 0)
        XCTAssertEqual(choice.finishReason, "finish reason")
    }
    
    func testUsageVariablesArePublic() {
        let usage = Usage(promptTokens: 1, completionTokens: 2, totalTokens: 3)
        
        XCTAssertEqual(usage.promptTokens, 1)
        XCTAssertEqual(usage.completionTokens, 2)
        XCTAssertEqual(usage.totalTokens, 3)
    }
}
