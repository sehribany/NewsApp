//
//  NewsCell.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//
import UIKit

public class NewsCell: UICollectionViewCell, ReusableView{
    
    public static var identifier: String = "NewsCell"
    
    private let newsCard = NewsCardView()
    
    private let lineView = UIView()
    
    weak var viewModel: NewsCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        addSubview(newsCard)
        newsCard.backgroundColor    = .appWhite
        newsCard.layer.cornerRadius = 2
        
        let bottomBorder = CALayer()
        let borderWidth: CGFloat = 0.3
        bottomBorder.frame = CGRect(x: 20, y: bounds.size.height - borderWidth, width: bounds.size.width - 40, height: borderWidth)
        bottomBorder.backgroundColor = Asset.Colors.appTitle.color.cgColor
        layer.addSublayer(bottomBorder)
        newsCard.edgesToSuperview(insets: .init(top: 0, left: 10, bottom: 0, right: 10))
    }
    
    public func set(viewModel: NewsCellProtocol) {
        self.viewModel = viewModel
        newsCard.set(viewModel: NewsCardViewModel(article: viewModel.article))
    }
}
