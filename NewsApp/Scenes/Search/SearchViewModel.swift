//
//  SearchViewModel.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import Foundation

protocol SearchViewDataSource {}

protocol SearchViewEventSource {}

protocol SearchViewProtocol: SearchViewDataSource, SearchViewEventSource {}

final class SearchViewModel: BaseViewModel<SearchRouter>, SearchViewProtocol {
    
}
