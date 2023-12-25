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
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("URL açılamadı")
            }
        }
    }
    
    @objc func backButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    private func formatDate(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    
        if let date = dateFormatter.date(from: dateString) {
            let newDateFormatter = DateFormatter()
            newDateFormatter.dateFormat = "dd/MM/yyyy"
            return newDateFormatter.string(from: date)
        } else {
            return nil
        }
    }
    
    private func authorControl(_ author: String?) -> String {
        guard let author = author, !author.isEmpty else {
            return "Anonymous"
        }
        return author
    }
    
    private func removeExtraText(_ input: String?) -> String {
        guard let input = input else {
            return ""
        }
        var modifiedString = input
        
        if let range = modifiedString.range(of: "\\[\\+\\d+ chars\\]", options: .regularExpression) {
            modifiedString.removeSubrange(range)
        }
        return modifiedString
    }
    
    public func set() {
        detailCardView.imageView.setImage(viewModel.articleDetail.urlToImage)
        detailCardView.titleLabel.text       = viewModel.articleDetail.title
        detailCardView.authorLabel.text      = authorControl(viewModel.articleDetail.author)
        detailCardView.dateLabel.text        = formatDate(viewModel.articleDetail.publishedAt)
        let trimmedText = removeExtraText(viewModel.articleDetail.content)
        detailCardView.descriptionLabel.text = trimmedText
    }
}
