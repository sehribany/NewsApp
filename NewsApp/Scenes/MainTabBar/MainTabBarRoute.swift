//
//  MainTabBarRoute.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//

protocol MainTabBarRoute {
    func presentMainTabBar()
}

extension MainTabBarRoute where Self: RouterProtocol{
    func presentMainTabBar(){
        let mainTabBarController = MainTabBarController()
        let transition           = PlaceOnWindowTransition()
        open(mainTabBarController, transition: transition) 
    }
}
