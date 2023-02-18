import SimpleNetwork
import Foundation

public final class OpenAIClient: Sendable {
    public let openAIApiKey: String
    public let networkClient: SimpleClient
    
    public init(openAIApiKey: String) {
        self.openAIApiKey = openAIApiKey
        self.networkClient = SimpleNetworkClient()
    }
}
