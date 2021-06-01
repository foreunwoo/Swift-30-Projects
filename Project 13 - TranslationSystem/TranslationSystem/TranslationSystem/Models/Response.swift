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
}

// MARK: - Result
struct Result: Codable {
    let srcLangType, tarLangType, translatedText: String
}
