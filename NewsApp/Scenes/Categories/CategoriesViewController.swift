//
//  CategoriesViewController.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import DataProvider
import UIKit

final class CategoriesViewController: BaseViewController<CategoriesViewModel> {
    
    private let collectionView: UICollectionView = {
        let layout                     = UICollectionViewFlowLayout()
        let collectionView             = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = Asset.Colors.appWhite.color
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Asset.Colors.appWhite.color
        addNavigationBarLogo()
        addSubViews()
        configureContents()
        viewModel.fetchNews(listingType: .business)
        subscribeViewModelEvents()
    }
    
    private func subscribeViewModelEvents() {
        viewModel.didSuccessFetchNews = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
}
// MARK: - UILayout
extension CategoriesViewController {
    
    private func addSubViews() {
        addCollectionView()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview()
    }
}

// MARK: - Configure and Set Localize
extension CategoriesViewController {
    private func configureContents() {
        collectionView.backgroundColor = Asset.Colors.appSecondaryBackground.color
        collectionView.delegate        = self
        collectionView.dataSource      = self
    }
}

// MARK: -HeaderViewEventSource
extension CategoriesViewController: HeaderViewEventSource{
    
    func didSelectHeaderItem(at index: IndexPath){
        switch index.item{
        case 0:
            viewModel.fetchNews(listingType: .business)
        case 1:
            viewModel.fetchNews(listingType: .entertainment)
        case 2:
            viewModel.fetchNews(listingType: .health)
        case 3:
            viewModel.fetchNews(listingType: .science)
        case 4:
            viewModel.fetchNews(listingType: .sports)
        case 5:
            viewModel.fetchNews(listingType: .technology)
        default:
            break
        }
        
        func didSelectHeaderItem(at index: IndexPath) {
            guard let listingType = ListingType(rawValue: index.item) else { return }
            viewModel.fetchNews(listingType: listingType)
        }
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
// MARK: - UICollectionViewDataSource
extension CategoriesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NewsCell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell
        let cellItem = self.viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.showNewsDetailScreen(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as! HeaderView
            headerView.delegate = self
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.width/7)
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: width - 260)
    }
}
