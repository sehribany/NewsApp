//
//  SearchViewController.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 12.12.2023.
//

import UIKit
import UIComponents

final class SearchViewController: BaseViewController<SearchViewModel> {
    
    private let searchBar: UISearchBar = {
        let searchBar             = UISearchBar()
        searchBar.backgroundColor = Asset.Colors.appSecondaryBackground.color
        searchBar.placeholder     = "Search News, Media, Topics..."
        return searchBar
    }()
    
    private let collectionView: UICollectionView = {
        let layout                     = UICollectionViewLayout()
        let collectionView             = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = Asset.Colors.appWhite.color
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Asset.Colors.appWhite.color
        addNavigationBarLogo()
        addSubViews()
        configureContents()
        subscribeViewModelEvents()
    }
    
    private func subscribeViewModelEvents() {
        viewModel.didSuccessFetchNews = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
}
// MARK: -UILayout
extension SearchViewController{
    
    private func addSubViews(){
        addSearchBar()
        addCollectionView()
    }
    
    private func addSearchBar(){
        view.addSubview(searchBar)
        searchBar.topToSuperview().constant      = 92
        searchBar.leadingToSuperview().constant  = 0
        searchBar.trailingToSuperview().constant = 0
    }
    
    private func addCollectionView(){
        view.addSubview(collectionView)
        collectionView.topToBottom(of: searchBar)
        collectionView.edgesToSuperview(excluding: .top)
    }
}

// MARK: - Configure and Set Localize
extension SearchViewController {
    private func configureContents() {
        searchBar.delegate        = self
        collectionView.delegate   = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModel.numberOfItemsAt(section: section)
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
}

// MARK: -UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.fetchNews(searchTitle: searchText)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
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
