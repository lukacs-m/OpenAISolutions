//
//  EditsConfiguration.swift
//  
//
//  Created by Martin Lukacs on 20/02/2023.
//

import Foundation

/**
A configuration for OpenAI's text edition API, providing information such as the model to use, the temperature, and various penalties.
 
 To create a configuration, you can use the default values by accessing the `default` static variable, or specify your own values by creating a new instance with the desired parameters.
 
 - Example:
 ```swift
 let config = EditsConfiguration(model: "davinci", temperature: 0.8)
 ```
 
 - Parameters:
    - model: The name of the language model to use for the completions. You can find the available models in the `GPT3Models` enum.
    - temperature: Controls the "creativity" of the generated text. A higher temperature leads to more diverse outputs.
    - topP: The probability mass to use for "nucleus" sampling. A lower value leads to more conservative outputs.

 - SeeAlso: [OpenAI Completion API](https://beta.openai.com/docs/api-reference/edits/create/)
 [Completions](https://platform.openai.com/docs/api-reference/edits)
 */
public struct EditsConfiguration {
    public let model: String
    public let temperature: Double
    public let topP: Double
    
    /**
     Initializes a new configuration with the specified parameters.
     
     - Parameters:
        - model: The name of the language model to use for the completions. You can find the available models in the `GPT3Models` enum.
        - temperature: Controls the "creativity" of the generated text. A higher temperature leads to more diverse outputs.
        - topP: The probability mass to use for "nucleus" sampling. A lower value leads to more conservative outputs.
     */
    public init(model: String,
                temperature: Double = 1.0,
                topP: Double = 1.0) {
        self.model = model
        self.temperature = (0...2).contains(temperature) ? temperature : 1
        self.topP = (0...1).contains(topP) ? topP : 1
    }
    
    /**
       A default configuration using the `davinci` language model, and default values for other parameters.

       Example:
     ```swift
     let config = EditsConfiguration.default
     ```
     */
    static public var `default`: EditsConfiguration {
        EditsConfiguration(model: GPTModels.Edits.davinciEdit.rawValue)
    }
}

extension EditsConfiguration {
    func toEditRequest(with input: String,
                       and instruction: String) -> EditRequest {
        EditRequest(model: model,
                    input: input,
                    instruction: instruction,
                    temperature: temperature,
                    topP: topP)
    }
}
