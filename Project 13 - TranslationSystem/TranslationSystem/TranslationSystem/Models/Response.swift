//
//  Response.swift
//  TranslationSystem
//
//  Created by eunwoo on 2021/06/01.
//

import Foundation

// MARK: - Welcome
struct Response: Codable {
    let message: Message
}

// MARK: - Message
struct Message: Codable {
    let type, service, version: String
    let result: Result

    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case service = "@service"
        case version = "@version"
        case result
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = (try? values.decode(String.self, forKey: .type)) ?? ""
        service = (try? values.decode(String.self, forKey: .service)) ?? ""
        version = (try? values.decode(String.self, forKey: .version)) ?? ""
        result = (try? values.decode(Result.self, forKey: .result))!
    }
}

// MARK: - Result
struct Result: Codable {
    let srcLangType, tarLangType, translatedText: String
    
    enum CodingKeys: String, CodingKey {
        case srcLangType
        case tarLangType
        case translatedText
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        srcLangType = (try? values.decode(String.self, forKey: .srcLangType)) ?? ""
        tarLangType = (try? values.decode(String.self, forKey: .tarLangType)) ?? ""
        translatedText = (try? values.decode(String.self, forKey: .translatedText)) ?? ""
    }
}
