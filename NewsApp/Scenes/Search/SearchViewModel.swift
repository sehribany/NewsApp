//
//  SearchViewModel.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import UIComponents

protocol SearchViewDataSource {
    func numberOfItemsAt(section: Int)    -> Int
    func cellItemAt(indexPath: IndexPath) -> NewsCellProtocol
}

protocol SearchViewEventSource {
    var didSuccessFetchNews: VoidClosure? { get set }
}

protocol SearchViewProtocol: SearchViewDataSource, SearchViewEventSource {
    func showNewsDetailScreen(at indexPath: IndexPath)
}

final class SearchViewModel: BaseViewModel<SearchRouter>, SearchViewProtocol {
    var didSuccessFetchNews: VoidClosure?
    var cellItems          : [NewsCellModel] = []
    
    private var page     = 1
    var isRequestEnabled = false
    var isPagingEnabled  = false
    
    func showNewsDetailScreen(at indexPath: IndexPath) {
        let news = cellItems[indexPath.row]
        router.pushNewsDetail(article: news.article)
    }

    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> NewsCellProtocol {
        return cellItems[indexPath.row]
    }
    
    init(router: SearchRouter) {
        super.init(router: router)
    }
}
// MARK: - Network
extension SearchViewModel{
    
    func fetchNews(searchTitle: String){
        let request = GetSearchNewsRequest(page: page, searchTitle: searchTitle)
        self.isRequestEnabled = false
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            self.isRequestEnabled = true
            switch result{
            case .success(let response):
                self.cellItems.removeAll()
                let cellItems = response.articles.map({NewsCellModel(article: $0)})
                self.cellItems.append(contentsOf: cellItems)
                self.page += 1
                self.didSuccessFetchNews?()
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
    func fetchMorePages(searchTitle: String) {
        fetchNews(searchTitle: searchTitle)
    }
}
