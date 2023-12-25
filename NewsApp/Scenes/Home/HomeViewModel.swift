//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import DataProvider

protocol HomeViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> NewsCellProtocol
}

protocol HomeViewEventSource {
    var didSuccessFetchNews: VoidClosure? { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func showNewsDetailScreen(at indexPath: IndexPath)
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var didSuccessFetchNews: VoidClosure?
    var cellItems          : [NewsCellModel] = []
    var title              : String?
    
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
    
    init(router: HomeRouter) {
        super.init(router: router)
    }
}

// MARK: - Network
extension HomeViewModel {
    
    func fetchNews() {
        let request = GetCountryNewsRequest(page: page)
        self.isRequestEnabled = false
        if page == 1 { showActivityIndicatorView?() }
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
    
    func fetchMorePages(){
        fetchNews()
    }
}
    
