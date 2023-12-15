//
//  SearchRoute.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

protocol SearchRoute{
    func pushSearch()
}

extension SearchRoute where Self: RouterProtocol{
    func pushSearch(){
        let router            = SearchRouter()
        let viewModel         = SearchViewModel(router: router)
        let viewController    = SearchViewController(viewModel: viewModel)
        
        let transition        = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        open(viewController, transition: transition)
    }
}
