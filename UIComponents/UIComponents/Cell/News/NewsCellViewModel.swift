//
//  NewsCellViewModel.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import DataProvider

public protocol NewsCellDataSource: AnyObject{
    var article: Article { get }
}

public protocol NewsCellEventSource: AnyObject {}

public protocol NewsCellProtocol: NewsCellDataSource, NewsCellEventSource {}

public final class NewsCellModel: NewsCellProtocol {
    
    public var article: Article
    
    public init(article: Article) {
        self.article = article
    }
}
