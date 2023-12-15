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
        backgroundColor = .appWhite
        newsCard.edgesToSuperview()
    }
    
    public func set(viewModel: NewsCellProtocol) {
        self.viewModel = viewModel
        newsCard.set(viewModel: NewsCardViewModel(article: viewModel.article))
    }
}
