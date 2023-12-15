//
//  CategoriesViewModel.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import Foundation

protocol CategoriesViewDataSource {}

protocol CategoriesViewEventSource {}

protocol CategoriesViewProtocol: CategoriesViewDataSource, CategoriesViewEventSource {}

final class CategoriesViewModel: BaseViewModel<CategoriesRouter>, CategoriesViewProtocol {
    
}
