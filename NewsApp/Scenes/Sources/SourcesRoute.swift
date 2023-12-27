//
//  SourcesRoute.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 26.12.2023.
//

protocol SourcesRoute {
    func presentSources(articleURL: URL)
}

extension SourcesRoute where Self: RouterProtocol{

    func  presentSources(articleURL: URL) {
        let router            = SourcesRouter()
        let viewModel         = SourcesViewModel(router: router, articleUrl: articleURL)
        let viewController    = SourcesViewController(viewModel: viewModel)
        
        let transition        = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
