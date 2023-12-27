//
//  SourcesViewModel.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 26.12.2023.
//

import Foundation

protocol SourcesViewDataSource {
    var articleURL: URL { get}
}

protocol SourcesViewEventSource {}

protocol SourcesViewProtocol: SourcesViewDataSource, SourcesViewEventSource {}

final class SourcesViewModel: BaseViewModel<SourcesRouter>, SourcesViewProtocol {
        
    var articleURL: URL
    
    init(router: SourcesRouter, articleUrl: URL) {
        self.articleURL = articleUrl
        super.init(router: router)
    }
}
