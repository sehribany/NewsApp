//
//  IntroCell.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//

import UIKit

public class IntroCell: UICollectionViewCell, ReusableView {
    
    public static var identifier: String = "IntroCell"
    
    private var imageView: UIImageView = {
        let imageView         = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var descriptionView: UIView = {
        let uiView = UIView()
        uiView.layer.cornerRadius  = 35
        uiView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        uiView.backgroundColor     = .appWhite
        return uiView
    }()
    
    private var titleLabel:UILabel = {
        let label           = UILabel()
        label.font          = UIFont.font(.nunitoBold, size: .xxLarge)
        label.textAlignment = .center
        label.textColor     = .appDark
        return label
    }()
    private var descriptionLabel: UILabel = {
        let label                       = UILabel()
        label.font                      = UIFont.font(.nunitoSemiBold, size: .xxLarge)
        label.textAlignment             = .center
        label.textColor                 = .appBlack
        label.numberOfLines             = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    private var descriptionStackView: UIStackView = {
        let stackView     = UIStackView()
        stackView.spacing = 20
        stackView.axis    = .vertical
        return stackView
    }()
    
    weak var viewModel: IntroCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        addSubViews()
    }
    
    public func set(viewModel: IntroCellProtocol){
        self.viewModel        = viewModel
        titleLabel.text       = viewModel.titleText
        descriptionLabel.text = viewModel.descriptionText
        imageView.image       = viewModel.image
    }
}

// MARK: - UILayout
extension IntroCell{
    func addSubViews(){
        addImageView()
        addDescriptionView()
        addDescriptionStackView()
    }
    
    private func addImageView(){
        contentView.addSubview(imageView)
        imageView.top(to: contentView)
    }
    
    private func addDescriptionView() {
        contentView.addSubview(descriptionView)
        descriptionView.topToBottom(of: imageView, offset: -100)
        descriptionView.edgesToSuperview(excluding: .top)
    }
    
    private func addDescriptionStackView() {
        descriptionView.addSubview(descriptionStackView)
        descriptionStackView.addArrangedSubview(titleLabel)
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.leadingToSuperview().constant  = 40
        descriptionStackView.trailingToSuperview().constant = -40
        descriptionStackView.topToSuperview().constant      = 60
    }
}
