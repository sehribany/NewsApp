//
//  NewsCardView.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import UIKit

public class NewsCardView: UIView {
    
    private var imageView: UIImageView = {
        let imageView                 = UIImageView()
        imageView.contentMode         = .scaleAspectFill
        imageView.layer.cornerRadius  = 10
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds       = true
        return imageView
    }()
    private var newsStackView : UIStackView = {
        let stackView       = UIStackView()
        stackView.axis      = .vertical
        stackView.spacing   = 8
        return stackView
    }()
    private var titleLabel: UILabel = {
        let label           = UILabel()
        label.font          = UIFont.font(.nunitoExtraBold, size: .medium)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor     = .appDark
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label                       = UILabel()
        label.font                      = UIFont.font(.nunitoBold, size: .small)
        label.textAlignment             = .left
        label.textColor                 = .appTitle
        label.numberOfLines             = 3
        return label
    }()
    
    weak var viewModel: NewsCardViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
}

//MARK: - UILayout
extension NewsCardView{
    private func addSubViews(){
        addImageView()
        addNewsStackView()
    }
    
    private func addImageView(){
        addSubview(imageView)
        imageView.leftToSuperview().constant = 10
        imageView.centerYToSuperview()
        imageView.width(100)
        imageView.height(100)
    }
    
    private func addNewsStackView(){
        addSubview(newsStackView)
        newsStackView.leadingToTrailing(of: imageView, offset: 10)
        newsStackView.trailingToSuperview().constant  = -10
        newsStackView.topToSuperview().constant = 18
        newsStackView.addArrangedSubview(titleLabel)
        newsStackView.addArrangedSubview(descriptionLabel)
    }
}

// MARK: - Configure and Set Localize
extension NewsCardView {
    public func set(viewModel: NewsCardViewProtocol) {
        self.viewModel          = viewModel
        let news                = viewModel.article
        imageView.setImage(news.urlToImage)
        titleLabel.text         = news.title
        descriptionLabel.text   = news.description
    }
}
