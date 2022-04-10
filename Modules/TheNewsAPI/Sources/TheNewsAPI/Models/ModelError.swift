//
// ModelError.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ModelError: Codable, JSONEncodable, Hashable {

    public private(set) var message: String
    public private(set) var code: Int

    public init(message: String, code: Int) {
        self.message = message
        self.code = code
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case message
        case code
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(message, forKey: .message)
        try container.encode(code, forKey: .code)
    }
}

