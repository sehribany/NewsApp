//
//  HeaderViewCell.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 22.12.2023.
//

import UIKit

public class HeaderViewCell: UICollectionViewCell, ReusableView {
    
    public static var identifier: String = "HeaderViewCell"

    public var titleLabel: UILabel = {
        let label           = UILabel()
        label.font          = UIFont.font(.nunitoExtraBold, size: .large)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor     = .appDark
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
    weak var viewModel: HeaderViewCellProtocol?
    
    public func set(viewModel: HeaderViewCellProtocol){
        self.viewModel        = viewModel
        titleLabel.text       = viewModel.titleText
    }
}

// MARK: - UILayout
extension HeaderViewCell{
    
    private func addSubViews(){
        addTitle()
    }
    
    private func addTitle(){
        addSubview(titleLabel)
        titleLabel.leadingToSuperview().constant  = 5
        titleLabel.trailingToSuperview().constant = -5
        titleLabel.topToSuperview().constant      = 1
        titleLabel.bottomToSuperview().constant   = -1
    }
}
