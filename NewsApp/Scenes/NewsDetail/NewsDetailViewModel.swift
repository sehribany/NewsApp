//
//  NewsDetailViewModel.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 19.12.2023.
//

import DataProvider

protocol NewsDetailViewDataSource {
    var articleDetail: Article { get}
}

protocol NewsDetailViewEventSource {}

protocol NewsDetailViewProtocol: NewsDetailViewDataSource, NewsDetailViewEventSource {}

final class NewsDetailViewModel: BaseViewModel<NewsDetailRouter>, NewsDetailViewProtocol {
    var articleDetail: Article
    
    init(articleDetail: Article, router: NewsDetailRouter) {
        self.articleDetail = articleDetail
        super.init(router: router)
    }
}
