//
//  NewsDetailCard.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 19.12.2023.
//

import UIKit

public class NewsDetailCardView: UIView {

    public var imageView: UIImageView = {
        let imageView                 = UIImageView()
        imageView.contentMode         = .scaleAspectFit
        imageView.layer.masksToBounds = false
        return imageView
    }()
    
    public var backButton : UIButton = {
        let button = UIButton()
        button.setImage(Asset.Icons.icBack.image, for: .normal)
        return button
    }()
    
    public var titleLabel: UILabel = {
        let label           = UILabel()
        label.font          = UIFont.font(.nunitoExtraBold, size: .xLarge)
        label.textAlignment = .left
        label.numberOfLines = 3
        label.textColor     = .appDark
        return label
    }()
    
    public var descriptionLabel: UILabel = {
        let label                       = UILabel()
        label.font                      = UIFont.font(.nunitoBold, size: .medium)
        label.textAlignment             = .left
        label.textColor                 = .appBlack
        label.numberOfLines             = 10
        return label
    }()
    
    public var dateLabel: UILabel = {
        let label                       = UILabel()
        label.font                      = UIFont.font(.nunitoBold, size: .xSmall)
        label.textAlignment             = .center
        label.textColor                 = .appTitle
        label.numberOfLines             = 3
        return label
    }()
    
    public var  pencilImageView: UIImageView = {
        let imageView                 = UIImageView()
        imageView.image               = UIImage(systemName: "pencil")
        imageView.contentMode         = .scaleAspectFit
        imageView.layer.masksToBounds = false
        imageView.tintColor           = Asset.Colors.appTitle.color
        return imageView
    }()
    
    public var authorLabel: UILabel = {
        let label                       = UILabel()
        label.font                      = UIFont.font(.nunitoBold, size: .small)
        label.textAlignment             = .center
        label.textColor                 = .appTitle
        label.numberOfLines             = 3
        return label
    }()
    
    public var newsSourceButton: UIButton = {
        let button                 = UIButton()
        button.backgroundColor     = Asset.Colors.appWhite.color
        button.titleLabel?.font    = UIFont.font(.nunitoBold, size: .xLarge)
        button.layer.borderWidth   = 0.5
        button.layer.borderColor   = Asset.Colors.appTitle.color.cgColor
        button.layer.cornerRadius  = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(Asset.Colors.appDark.color, for: .normal)
        button.setTitle("News Source", for: .normal)
        return button
    }()
    
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
extension NewsDetailCardView{
    private func addSubViews(){
        addImageView()
        addBackButton()
        addDateLabel()
        addAuthorLabel()
        addPencilView()
        addTitleLabel()
        adddescriptionLabel()
        addButton()
    }
    
    private func addImageView(){
        addSubview(imageView)
        imageView.leadingToSuperview()
        imageView.trailingToSuperview()
        imageView.topToSuperview()
    }
    
    private func addBackButton(){
        addSubview(backButton)
        backButton.topToSuperview().constant     = 35
        backButton.leadingToSuperview().constant = 25
    }
    
    private func addDateLabel(){
        addSubview(dateLabel)
        dateLabel.topToBottom(of: imageView, offset: 15)
        dateLabel.leadingToSuperview().constant = 10
    }
    
    private func  addAuthorLabel(){
        addSubview(authorLabel)
        authorLabel.topToBottom(of: imageView, offset: 15)
        authorLabel.trailingToSuperview().constant = -10
    }
    
    private func addPencilView(){
        addSubview(pencilImageView)
        pencilImageView.trailingToLeading(of: authorLabel).constant = -4
        pencilImageView.topToBottom(of: imageView, offset: 11)
    }
    
    private func addTitleLabel(){
        addSubview(titleLabel)
        titleLabel.topToBottom(of: dateLabel, offset: 25)
        titleLabel.leadingToSuperview().constant  = 10
        titleLabel.trailingToSuperview().constant = -10
    }
    
    private func adddescriptionLabel(){
        addSubview(descriptionLabel)
        descriptionLabel.topToBottom(of: titleLabel, offset: 15)
        descriptionLabel.leadingToSuperview().constant  = 10
        descriptionLabel.trailingToSuperview().constant = -10
    }
    
    private func addButton(){
        addSubview(newsSourceButton)
        newsSourceButton.leadingToSuperview().constant  = 20
        newsSourceButton.trailingToSuperview().constant = -20
        newsSourceButton.bottomToSuperview().constant   = -100
        newsSourceButton.height(55)
    }
}
