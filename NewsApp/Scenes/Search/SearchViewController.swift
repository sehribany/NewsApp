//
//  SearchViewController.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import UIKit

final class SearchViewController: BaseViewController<SearchViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Asset.Colors.appWhite.color
        addNavigationBarLogo()
    }
    
}
