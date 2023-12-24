//
//  HeaderViewModel.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 24.12.2023.
//

protocol HeaderViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> HeaderViewCellProtocol
}

protocol HeaderViewEventSource {
    func didSelectHeaderItem(at index: IndexPath)
}

protocol HeaderViewProtocol: HeaderViewDataSource, HeaderViewEventSource {}

final class HeaderViewModel: HeaderViewProtocol {

    private var cellCategories : [HeaderViewCellProtocol] = [HeaderViewCellModel(titleText: "Business"),
                                                             HeaderViewCellModel(titleText: "Entertainment"),
                                                             HeaderViewCellModel(titleText: "Health"),
                                                             HeaderViewCellModel(titleText: "Science"),
                                                             HeaderViewCellModel(titleText: "Sports"),
                                                             HeaderViewCellModel(titleText: "Technology")]
    
    func numberOfItemsAt(section: Int) -> Int {
        cellCategories.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> HeaderViewCellProtocol {
        cellCategories[indexPath.row]
    }
    
    func didSelectHeaderItem(at index: IndexPath) {
        print(index)
    }
}
