//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import UIKit
import UIComponents
import KeychainSwift

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    private lazy var subViewControllers: [UIViewController] = {
        return self.preparedViewControllers()
    }()
    
    private let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
    
}
// MARK: - UILayout
extension HomeViewController {
    
    private func addSubViews() {
        addPageViewController()
        addNavigationBarLogo()
    }
    
    private func addPageViewController() {
        view.addSubview(pageViewController.view)
        pageViewController.view.edgesToSuperview(excluding: .top, usingSafeArea: true)
    }
}

// MARK: - Configure and Set Localize
extension HomeViewController {
    
    private func configureContents() {
        view.backgroundColor = Asset.Colors.appWhite.color
        definesPresentationContext = true
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        pageViewController.delegate   = self
        pageViewController.dataSource = self
    }
}
// MARK: - UIPageViewController
extension HomeViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex = subViewControllers.firstIndex(of: viewController) ?? 0
        if currentIndex <= 0 {
            return nil
        }
        return subViewControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = subViewControllers.firstIndex(of: viewController) ?? 0
        if currentIndex >= subViewControllers.count - 1 {
            return nil
        }
        return subViewControllers[currentIndex + 1]
    }
}
// MARK: - Logout
extension HomeViewController {

    private func checkIsUserLogin() {
        if keychain.get(Keychain.token) != nil {
            setupLogoutRightBarButton()
        } else {
            navigationItem.rightBarButtonItem = .none
        }
    }
    
    @objc
    private func logoutBarButtonDidTap() {
        viewModel.userLogout()
    }
}
