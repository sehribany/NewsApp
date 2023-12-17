//
//  BaseViewController.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//

import UIKit

class BaseViewController<V: BaseViewProtocol>: UIViewController {
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToast()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func subscribeToast() {
        viewModel.showWarningToast = { text in
            ToastPresenter.showWarningToast(text: text)
        }
    }
    
    func showWarningToast(message: String) {
        ToastPresenter.showWarningToast(text: message)
    }
}

// MARK: - NavigationBar Logo
extension BaseViewController {
    func addNavigationBarLogo() {
        let image                = Asset.Images.logo.image
        let imageView            = UIImageView()
        imageView.size(CGSize(width: 100, height: 40))
        imageView.contentMode    = .scaleAspectFit
        imageView.image          = image
        navigationItem.titleView = imageView
    }
}
