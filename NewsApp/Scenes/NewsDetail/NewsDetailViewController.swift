//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 19.12.2023.
//

import UIKit
import UIComponents

final class NewsDetailViewController: BaseViewController<NewsDetailViewModel> {
    
    private let detailCardView = NewsDetailCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Asset.Colors.appWhite.color
        navigationController?.isNavigationBarHidden = true
        addSubViews()
        set()
    }
}
// MARK: - UILayout
extension NewsDetailViewController {
    
    private func addSubViews() {
        addDetailView()
    }
    
    private func addDetailView() {
        view.addSubview(detailCardView)
        detailCardView.edgesToSuperview()
        detailCardView.newsSourceButton.addTarget(self, action: #selector(newsSourceButtonTapped), for: .touchUpInside)
        detailCardView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
}
// MARK: - Configure and Set Localize
extension NewsDetailViewController {
    
    @objc func newsSourceButtonTapped() {
        if let url = URL(string: viewModel.articleDetail.url) {
            viewModel.showNewsSourcesScreen(at: url)
        }
    }
    
    @objc func backButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    private func authorControl(_ author: String?) -> String {
        guard let author = author, !author.isEmpty else {
            return "Anonymous"
        }
        return author
    }
    
    public func set() {
        detailCardView.imageView.setImage(viewModel.articleDetail.urlToImage)
        detailCardView.titleLabel.text       = viewModel.articleDetail.title
        detailCardView.authorLabel.text      = authorControl(viewModel.articleDetail.author)
        detailCardView.dateLabel.text        = viewModel.articleDetail.publishedAt.dateFormatter()
        let trimmedText                      = viewModel.articleDetail.content!.removeExtraText()
        detailCardView.descriptionLabel.text = trimmedText
    }
}
