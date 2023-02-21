//
//  CompletionsConfiguration.swift
//  
//
//  Created by Martin Lukacs on 17/02/2023.
//

import Foundation

/**
A configuration for OpenAI's Completion API, providing information such as the model to use, the temperature, maximum number of tokens, and various penalties.
 
 To create a configuration, you can use the default values by accessing the `default` static variable, or specify your own values by creating a new instance with the desired parameters.
 
 - Example:
 ```swift
 let config = CompletionsConfiguration(model: "davinci", maxTokens: 32, temperature: 0.8, stop: ["\n"])
 ```
 
 - Parameters:
    - model: The name of the language model to use for the completions. You can find the available models in the `GPT3Models` enum.
    - maxTokens: The maximum number of tokens to generate in the completion.
    - temperature: Controls the "creativity" of the generated text. A higher temperature leads to more diverse outputs.
    - topP: The probability mass to use for "nucleus" sampling. A lower value leads to more conservative outputs.
    - frequencyPenalty: A penalty factor to apply based on the frequency of tokens in the generated text. A higher penalty leads to more diverse outputs.
    - presencePenalty: A penalty factor to apply based on the presence of tokens in the generated text. A higher penalty leads to less repetition.
    - stop: An optional list of strings that the generated text should not contain. If any of these strings are generated, the completion will stop early.

 - SeeAlso: [OpenAI Completion API](https://beta.openai.com/docs/api-reference/completions/create/)
 [Completions](https://platform.openai.com/docs/api-reference/completions)
 */
public struct CompletionsConfiguration {
    public let model: String
    public let temperature: Double
    public let maxTokens: Int
    public let topP: Double
    public let frequencyPenalty: Double
    public let presencePenalty: Double
    public let stop: String?
    
    /**
      Initializes a new configuration with the specified parameters.

      - Parameters:
         - model: The name of the language model to use for the completions. You can find the available models in the `GPT3Models` enum.
         - maxTokens: The maximum number of tokens to generate in the completion.
         - temperature: Controls the "creativity" of the generated text. A higher temperature leads to more diverse outputs.
         - topP: The probability mass to use for "nucleus" sampling. A lower value leads to more conservative outputs.
         - frequencyPenalty: A penalty factor to apply based on the frequency of tokens in the generated text. A higher penalty leads to more diverse outputs.
         - presencePenalty: A penalty factor to apply based on the presence of tokens in the generated text. A higher penalty leads to less repetition.
         - stop: An optional list of strings that the generated text should not contain. If any of these strings are generated, the completion will stop early.
      */
    public init(model: String,
                maxTokens: Int = 16,
                temperature: Double = 1.0,
                topP: Double = 1.0,
                frequencyPenalty: Double = 0,
                presencePenalty: Double = 0,
                stop: String? = nil) {
        self.model = model
        self.temperature = (0...2).contains(temperature) ? temperature : 1
        self.maxTokens = model.contains("davinci") ? (maxTokens > 4000 ? 4000 : maxTokens) : (maxTokens > 2048 ? 2048 : maxTokens)
        self.topP = (0...1).contains(topP) ? topP : 1
        self.frequencyPenalty = (-2...2).contains(frequencyPenalty) ? frequencyPenalty : 0
        self.presencePenalty = (-2...2).contains(presencePenalty) ? presencePenalty : 0
        self.stop = stop
    }
    
    /**
       A default configuration using the `davinci` language model, and default values for other parameters.

       Example:
     ```swift
     let config = CompletionsConfiguration.default
     ```
     */
    static public var `default`: CompletionsConfiguration {
        CompletionsConfiguration(model: GPTModels.Completions.davinci.name)
    }
}

extension CompletionsConfiguration {
    func toCompletionRequest(with prompt: String) -> CompletionRequest {
        CompletionRequest(model: model,
                          prompt: prompt,
                          temperature: temperature,
                          maxTokens: maxTokens,
                          topP: topP,
                          frequencyPenalty: frequencyPenalty,
                          presencePenalty: presencePenalty,
                          stop: stop)
    }
}
