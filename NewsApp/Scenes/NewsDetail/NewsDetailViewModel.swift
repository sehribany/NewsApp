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

protocol NewsDetailViewProtocol: NewsDetailViewDataSource, NewsDetailViewEventSource {
    func showNewsSourcesScreen(at url: URL)
}

final class NewsDetailViewModel: BaseViewModel<NewsDetailRouter>, NewsDetailViewProtocol {
    
    func showNewsSourcesScreen(at url: URL) {
        router.presentSources(articleURL: url)
    }
    
    var articleDetail: Article
    
    init(articleDetail: Article, router: NewsDetailRouter) {
        self.articleDetail = articleDetail
        super.init(router: router)
    }
}
