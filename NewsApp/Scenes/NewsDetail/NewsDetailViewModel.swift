//
//  NewsDetailViewModel.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 19.12.2023.
//

import Foundation

protocol NewsDetailViewDataSource {}

protocol NewsDetailViewEventSource {}

protocol NewsDetailViewProtocol: NewsDetailViewDataSource, NewsDetailViewEventSource {}

final class NewsDetailViewModel: BaseViewModel<NewsDetailRouter>, NewsDetailViewProtocol {
    
}
