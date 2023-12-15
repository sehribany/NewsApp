//
//  News.swift
//  DataProvider
//
//  Created by Şehriban Yıldırım on 11.12.2023.
//

// MARK: - News
public struct News: Codable {
    public let status      : String
    public let totalResults: Int
    public let articles    : [Article]
    public let sources     : [Source]
    
    public init(status: String, totalResults: Int, articles: [Article], sources: [Source]) {
        self.status       = status
        self.totalResults = totalResults
        self.articles     = articles
        self.sources      = sources
    }
}
