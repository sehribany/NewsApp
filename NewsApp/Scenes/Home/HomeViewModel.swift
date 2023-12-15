//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import DataProvider

protocol HomeViewDataSource {
    var numberOfItems: Int { get }
    func cellItem(for indexPath: IndexPath) -> NewsCellProtocol
}

protocol HomeViewEventSource {
    var didSuccessFetchNews: VoidClosure? { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func fetchNews()
    func fetchMorePages()
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {

    private var page     = 1
    var isRequestEnabled = false
    var isPagingEnabled  = false
    var cellItems          : [NewsCellModel] = []
    var didSuccessFetchNews: VoidClosure?

    var numberOfItems: Int {
        return cellItems.count
    }
    
    func cellItem(for indexPath: IndexPath) -> NewsCellProtocol {
        let cellItem = cellItems[indexPath.item]
        return cellItem
    }
}

// MARK: - Network
extension HomeViewModel {
    
    func fetchNews() {

        
        

        
    }
    
    func fetchMorePages() {
        fetchNews()
    }
}
