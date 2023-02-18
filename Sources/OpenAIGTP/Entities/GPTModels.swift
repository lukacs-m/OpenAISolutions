`//
//  GPTModels.swift
//
//
//  Created by Martin Lukacs on 17/02/2023.
//

import Foundation

/**
 `GPTModels`  represents different pre-trained language models provided by OpenAI's GPT (Generative Pre-trained Transformer) platform. Each case in the enumeration represents a specific model with its own name.
 
 You can find more information at the fooling link [GPT-3 Models OpenAI API Docs](https://beta.openai.com/docs/models/gpt-3)
 */
public enum GPTModels: String {
    /**
     This is the most capable and most expensive model provided by OpenAI's GPT platform. It is designed to handle a wide range of natural language tasks, including conversation, question answering, summarization, and more. This model is capable of producing very high-quality text output, but it requires a lot of computational resources and may not be suitable for all use cases.
     */
    case davinci = "text-davinci-003"
    
 /**
  This is a smaller and less expensive model than ``davinci``, but still more capable than ``babbage`` and ``ada``. It is designed to handle a variety of natural language tasks, including text completion, summarization, and more. This model is suitable for many applications, but may not be as accurate or flexible as ``davinci``.
  */
    case curie = "text-curie-001"
    
    /// Capable of straightforward tasks, very fast, and lower cost.
    case babbage = "text-babbage-001"
    
    /// Capable of very simple tasks, usually the fastest model in the GPT-3 series, and lowest cost.
    case ada = "text-ada-001"
    
    public var name: String {
        self.rawValue
    }
}
