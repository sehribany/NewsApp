//
//  Source.swift
//  DataProvider
//
//  Created by Şehriban Yıldırım on 11.12.2023.
//

// MARK: - Source
public struct Source: Codable {
    public let id         : String
    public let name       : String
    public let description: String
    public let url        : String
    public let category   : Category
    public let language   : String
    public let country    : String
    
    public init(id: String, name: String, description: String, url: String, category: Category, language: String, country: String) {
        self.id          = id
        self.name        = name
        self.description = description
        self.url         = url
        self.category    = category
        self.language    = language
        self.country     = country
    }
}

public enum Category: String, Codable {
    case business      = "business"
    case entertainment = "entertainment"
    case general       = "general"
    case health        = "health"
    case science       = "science"
    case sports        = "sports"
    case technology    = "technology"
}
