//
//  Article.swift
//  DataProvider
//
//  Created by Şehriban Yıldırım on 11.12.2023.
//

// MARK: - Article
public struct Article: Codable {
    public let source     : Source
    public let author     : String?
    public let title      : String
    public let description: String?
    public let url        : String
    public let urlToImage : String?
    public let publishedAt: Date
    public let content    : String
    
    public init(source: Source, author: String?, title: String, description: String?, url: String, urlToImage: String?, publishedAt: Date, content: String) {
        self.source      = source
        self.author      = author
        self.title       = title
        self.description = description
        self.url         = url
        self.urlToImage  = urlToImage
        self.publishedAt = publishedAt
        self.content     = content
    }
}