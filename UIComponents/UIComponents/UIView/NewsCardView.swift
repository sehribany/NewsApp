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
        imageView.layer.cornerRadius = 8 
        imageView.clipsToBounds = true
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
        label.textAlignment = .left
        label.numberOfLines = 2
        label.textColor     = .appDark
        return label
    }()
    private var descriptionLabel: UILabel = {
        let label                       = UILabel()
        label.font                      = UIFont.font(.nunitoSemiBold, size: .xLarge)
        label.textAlignment             = .left
        label.textColor                 = .appBlack
        label.numberOfLines             = 3
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
        imageView.leftToSuperview().constant  = 15
        imageView.rightToSuperview().constant = -15
        imageView.aspectRatio(1)
    }
    
    private func addNewsStackView(){
        addSubview(newsStackView)
        newsStackView.topToBottom(of: imageView)
        newsStackView.leftToSuperview().constant  = 15
        newsStackView.rightToSuperview().constant = -15
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
