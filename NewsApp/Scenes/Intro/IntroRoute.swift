//
//  IntroRoute.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//

protocol IntroRoute {
    func presentIntro()
}

extension IntroRoute where Self: RouterProtocol{

    func  presentIntro() {
        let router            = IntroRouter()
        let viewModel         = IntroViewModel(router: router)
        let viewController    = IntroViewController(viewModel: viewModel)
        
        let transition        = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
