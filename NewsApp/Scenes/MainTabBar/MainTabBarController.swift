//
//  MainTabBarController.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 11.12.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        let searchViewController     = createSearchViewController()
        let homeViewController       = createHomeViewController(categoryName: "general")
        let categoriesViewController = createCategoriesViewController()
        viewControllers              = [categoriesViewController,homeViewController,searchViewController]
    }
    
    private func configureTabBarIcons(navController: MainNavigationController, icon:UIImage?) {
        navController.tabBarItem.image = icon
    }
    
    private func configureContents() {
        tabBar.tintColor         = Asset.Colors.appDark.color
        addLineToTabBar()
    }
    
    func addLineToTabBar(){
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: 1))
        lineView.backgroundColor = Asset.Colors.appDark.color
        tabBar.addSubview(lineView)
        tabBar.bringSubviewToFront(lineView)
    }
    
    private func createSearchViewController() -> UINavigationController{
        let searchRouter            = SearchRouter()
        let searchViewModel         = SearchViewModel(router: searchRouter)
        let searchViewController    = SearchViewController(viewModel: searchViewModel)
        let navController           = MainNavigationController(rootViewController: searchViewController)
        configureTabBarIcons(navController: navController, icon: Asset.Icons.icSearch.image)
        searchRouter.viewController = searchViewController
        return navController
    }
    
    private func createHomeViewController(categoryName: String) -> UINavigationController{
        let homeRouter            = HomeRouter()
        let homeViewModel         = HomeViewModel(router: homeRouter)
        let homeViewController    = HomeViewController(viewModel: homeViewModel)
        let navController         = MainNavigationController(rootViewController: homeViewController)
        configureTabBarIcons(navController: navController, icon: Asset.Icons.icHome.image)
        homeRouter.viewController = homeViewController
        return navController
    }
    
    private func createCategoriesViewController() -> UINavigationController{
        let categoriesRouter            = CategoriesRouter()
        let categoriesViewModel         = CategoriesViewModel(router: categoriesRouter)
        let categoriesViewController    = CategoriesViewController(viewModel: categoriesViewModel)
        let navController               = MainNavigationController(rootViewController: categoriesViewController)
        configureTabBarIcons(navController: navController, icon: Asset.Icons.icCategories.image)
        categoriesRouter.viewController = categoriesViewController
        return navController
    }
}
