//
//  NewsCardView.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import UIKit

public class NewsCardView: UIView {

    private var imageView: UIImageView = {
        let imageView         = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private var newsStackView : UIStackView = {
        let stackView       = UIStackView()
        stackView.axis      = .vertical
        stackView.spacing   = 10
        return stackView
    }()
    private var titleLabel: UILabel = {
        let label           = UILabel()
        label.font          = UIFont.font(.nunitoBold, size: .xLarge)
        label.textAlignment = .center
        label.textColor     = .appDark
        return label
    }()
    private var descriptionLabel: UILabel = {
        let label                       = UILabel()
        label.font                      = UIFont.font(.nunitoSemiBold, size: .xLarge)
        label.textAlignment             = .center
        label.textColor                 = .appBlack
        label.numberOfLines             = 0
        label.adjustsFontSizeToFitWidth = true
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
        imageView.rightToSuperview().constant = -10
        imageView.width(100)
        imageView.height(100)
    }
    
    private func addNewsStackView(){
        addSubview(newsStackView)
        newsStackView.addArrangedSubview(titleLabel)
        newsStackView.addArrangedSubview(descriptionLabel)
        newsStackView.leadingToSuperview().constant  = 20
        newsStackView.trailingToSuperview().constant = -20
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
