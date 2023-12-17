//
//  Source.swift
//  DataProvider
//
//  Created by Şehriban Yıldırım on 11.12.2023.
//

// MARK: - Source
public struct Source: Codable {
    public let id         : String?
    public let name       : String

    public init(id: String?, name: String) {
        self.id          = id
        self.name        = name
    }
}
