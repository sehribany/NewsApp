//
//  HomeRoute.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

protocol HomeRoute{
    func placeOnWindowHome()
}

extension HomeRoute where Self: RouterProtocol{
    func placeOnWindowHome() {
        let router            = HomeRouter()
        let viewModel         = HomeViewModel(router: router)
        let viewController    = HomeViewController(viewModel: viewModel)
        
        let transition        = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
