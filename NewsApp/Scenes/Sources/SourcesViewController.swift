//
//  SourcesViewController.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 26.12.2023.
//

import UIKit
import WebKit

final class SourcesViewController: BaseViewController<SourcesViewModel> {
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Asset.Colors.appWhite.color
        addSubViews()
        configureContents()
        loadWebView()
    }
    
    private func loadWebView() {
        let request = URLRequest(url: viewModel.articleURL)
        webView.load(request)
    }
}
// MARK: -UILayout
extension SourcesViewController{
    private func addSubViews(){
        addWebView()
    }
    
    private func addWebView(){
        view.addSubview(webView)
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive             = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive           = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive               = true
    }
}

// MARK: - Configure and Set Localize
extension SourcesViewController {
    private func configureContents() {
        webView.navigationDelegate = self
    }
}

// MARK: -WKNavigationDelegate
extension SourcesViewController: WKNavigationDelegate{
    
}
