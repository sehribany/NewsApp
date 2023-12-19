//
//  NewsDetailRoute.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 19.12.2023.
//

import Foundation

protocol NewsDetailRoute{
    func pushNewsDetail(article: Article)
}

extension NewsDetailRoute  where Self: RouterProtocol {
    func pushNewsDetail(article: Article){
        let router            = NewsDetailRouter()
        let viewModel         = NewsDetailViewModel(articleDetail: article, router: router)
        let viewController    = NewsDetailViewController(viewModel: viewModel)
        
        let transition        = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        open(viewController, transition: transition)
    }
}
