//
//  NewsCardViewModel.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//
import DataProvider

public protocol NewsCardViewDataSource: AnyObject{
    var article: Article { get}
}

public protocol NewsCardViewEventSource: AnyObject {}

public protocol NewsCardViewProtocol: NewsCardViewDataSource, NewsCardViewEventSource {}

public final class NewsCardViewModel: NewsCardViewProtocol {
    public var article: Article
    public init(article: Article) {
        self.article = article
    }
}
