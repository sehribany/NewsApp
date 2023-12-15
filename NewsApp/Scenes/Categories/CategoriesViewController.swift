//
//  CategoriesViewController.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import UIKit

final class CategoriesViewController: BaseViewController<CategoriesViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Asset.Colors.appWhite.color
        addNavigationBarLogo()
    }
    
}
