//
//  HeaderView.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 22.12.2023.
//

import UIKit
import DataProvider

public class HeaderView: UICollectionReusableView {
    
    public static var identifier: String = "HeaderView"
    
    public let nestedCollectionView: UICollectionView = {
        let layout             = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView     = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HeaderViewCell.self, forCellWithReuseIdentifier: HeaderViewCell.identifier)
        return collectionView
    }()
   
    init(frame: CGRect, viewModel: HeaderViewProtocol) {
        self.viewmodel = viewModel
        super.init(frame: frame)
        addSubViews()
    }

    override init(frame: CGRect) {
        self.viewmodel = HeaderViewModel()
        super.init(frame: frame)
        addSubViews()
    }

    required init?(coder aDecoder: NSCoder) {
        self.viewmodel = HeaderViewModel()
        super.init(coder: aDecoder)
        addSubViews()
    }
    
    weak var viewModel: HeaderViewCellProtocol?
    var viewmodel     : HeaderViewProtocol
}
// MARK: - UILayout

extension HeaderView{
    
    public func addSubViews(){
        addCollectionView()
    }
    
    public func addCollectionView(){
        addSubview(nestedCollectionView)
        nestedCollectionView.dataSource = self
        nestedCollectionView.delegate   = self
        nestedCollectionView.frame      = bounds
    }
}

extension HeaderView : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.numberOfItemsAt(section: section) 
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell               = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderViewCell.identifier, for: indexPath) as! HeaderViewCell
        cell.layer.borderWidth = 0.4
        cell.layer.borderColor = Asset.Colors.appTitle.color.cgColor
        let cellItem           = viewmodel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 25)
    }
}
