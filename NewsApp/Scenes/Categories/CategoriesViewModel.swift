//
//  CategoriesViewModel.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import UIComponents

protocol CategoriesViewDataSource {
    func numberOfItemsAt(section: Int)    -> Int
    func cellItemAt(indexPath: IndexPath) -> NewsCellProtocol
}

protocol CategoriesViewEventSource {
    var didSuccessFetchNews: VoidClosure? { get set }
}

protocol CategoriesViewProtocol: CategoriesViewDataSource, CategoriesViewEventSource {
    func showNewsDetailScreen(at indexPath: IndexPath)
}

final class CategoriesViewModel: BaseViewModel<CategoriesRouter>, CategoriesViewProtocol {
    
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
    
    init(router: CategoriesRouter) {
        super.init(router: router)
    }
}

// MARK: - Network
extension CategoriesViewModel {
    
    func fetchNews(listingType: ListingType) {
        var request :GetNewsRequest
        switch listingType{
        case .business:
            request = GetNewsRequest(page: page, listingType: .business)
        case .entertainment:
            request = GetNewsRequest(page: page, listingType: .entertainment)
        case .health:
            request = GetNewsRequest(page: page, listingType: .health)
        case .science:
            request = GetNewsRequest(page: page, listingType: .science)
        case .sports:
            request = GetNewsRequest(page: page, listingType: .sports)
        case .technology:
            request = GetNewsRequest(page: page, listingType: .technology)
        }
        self.isRequestEnabled = false
        if page == 1 { showActivityIndicatorView?() }
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            self.isRequestEnabled = true
            switch result{
            case .success(let response):
                let cellItems = response.articles.map({NewsCellModel(article: $0)})
                self.cellItems.append(contentsOf: cellItems)
                self.page += 1
                self.didSuccessFetchNews?()
            case .failure(let error):
                print("\(error.localizedDescription) ER \(error)")
            }
        }
    }
    
    func fetchMorePages(listingType: ListingType) {
        fetchNews(listingType: listingType)
    }
}
