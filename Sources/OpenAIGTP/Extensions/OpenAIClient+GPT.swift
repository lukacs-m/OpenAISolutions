//
//  File.swift
//  
//
//  Created by Martin Lukacs on 17/02/2023.
//

import Foundation
import OpenAIClient
import SimpleNetwork
import Combine

enum GPTEndpoint {
    case completion(completionRequest: CompletionRequest, token: String)
    case edit(editRequest: EditRequest, token: String)
}

extension GPTEndpoint: Endpoint  {
    var baseUrl: String? {
        APIConfiguration.baseUrl
    }
    
    var path: String {
        switch self {
        case .completion:
            return APIConfiguration.EndPoints.completions
        case .edit:
            return APIConfiguration.EndPoints.edits
        }
    }
    
    var method: CRUDRequestMethod {
        switch self {
        case .completion, .edit:
            return .post
        }
    }
    
    var header: [String: String]? {
        switch self {
        // Access Token to use in Bearer header
        case .completion(_, let token),
                .edit(_, let token):
            return [
                "Authorization": "Bearer \(token)",
                "Content-Type": "application/json"
            ]
        }
    }
    
    var body: [String: Any]? {
        switch self {
        case .completion(let request, _):
            return request.convertToDictionary()
        case .edit(let request, _):
            return request.convertToDictionary()
        }
    }
}

/// Protocol for generating text completions using the OpenAI API
public protocol CompletionServicing {
    
    // MARK: - Completions
    /// Generates a completion for the given prompt and configuration asynchronously.
    ///
    /// - Parameters:
    ///   - prompt: The prompt text to generate a completion for.
    ///   - configuration: The configuration for generating the completion. It is a ``CompletionsConfiguration``
    ///
    /// - Returns: A ``Completion`` object representing the generated completion.
    ///
    /// - Throws: An error if the completion could not be generated.
    func completion(with prompt: String, and configuration: CompletionsConfiguration) async throws -> Completion
    
    /// Generates a completion for the given prompt and configuration as a `AnyPublisher`.
    ///
    /// - Parameters:
    ///   - prompt: The prompt text to generate a completion for.
    ///   - configuration: The configuration for generating the completion.  It is a ``CompletionsConfiguration``
    ///
    /// - Returns: A `AnyPublisher` that emits a ``Completion``  object or an error.
    func completion(with prompt: String, and configuration: CompletionsConfiguration) -> AnyPublisher<Completion, Error>
    
    // MARK: - Edits
    
    func edit(for input: String, following instruction: String, and configuration: EditsConfiguration) async throws -> Edit
    func edit(for input: String, following instruction: String, and configuration: EditsConfiguration) -> AnyPublisher<Edit, Error>

}

/// An implementation of ``CompletionServicing``t hat uses the OpenAI API.
extension OpenAIClient: CompletionServicing {
    
    /// Generates a completion for the given prompt and configuration asynchronously.
    ///
    /// - Parameters:
    ///   - prompt: The prompt text to generate a completion for.
    ///   - configuration: The configuration for generating the completion.
    ///
    /// - Returns: A `Completion` object representing the generated completion.
    ///
    /// - Throws: An error if the completion could not be generated.
    public func completion(with prompt: String,
                           and configuration: CompletionsConfiguration = .default) async throws -> Completion {
        try await networkClient.request(endpoint:
                                            GPTEndpoint.completion(completionRequest: configuration.toCompletionRequest(with: prompt),
                                                               token: openAIApiKey))
    }
    
    /// Generates a completion for the given prompt and configuration as a `AnyPublisher`.
    ///
    /// - Parameters:
    ///   - prompt: The prompt text to generate a completion for.
    ///   - configuration: The configuration for generating the completion.
    ///
    /// - Returns: A `AnyPublisher` that emits a `Completion` object or an error.
    public func completion(with prompt: String,
                           and configuration: CompletionsConfiguration = .default) -> AnyPublisher<Completion, Error> {
        let completionRequest = configuration.toCompletionRequest(with: prompt)
        return networkClient.request(endpoint: GPTEndpoint.completion(completionRequest: completionRequest,
                                                                      token: openAIApiKey))
    }
    
    public func edit(for input: String, following instruction: String,
                     and configuration: EditsConfiguration  = .default) async throws -> Edit {
        let editRequest = configuration.toEditRequest(with: input, and: instruction)
        return try await networkClient.request(endpoint: GPTEndpoint.edit(editRequest: editRequest,
                                                                token: openAIApiKey))
    }
    
    public func edit(for input: String, following instruction: String,
                     and configuration: EditsConfiguration = .default) -> AnyPublisher<Edit, Error> {
            let editRequest = configuration.toEditRequest(with: input, and: instruction)
            return networkClient.request(endpoint: GPTEndpoint.edit(editRequest: editRequest,
                                                                    token: openAIApiKey))
    }
}
