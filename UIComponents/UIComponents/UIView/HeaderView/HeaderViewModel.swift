//
//  HeaderViewModel.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 22.12.2023.
//

protocol HeaderViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> HeaderViewCellProtocol
}

protocol HeaderViewEventSource {}

protocol HeaderViewProtocol: HeaderViewDataSource, HeaderViewEventSource {}

final class HeaderViewModel: HeaderViewProtocol {
    
    private var cellCategories : [HeaderViewCellProtocol] = [HeaderViewCellModel(titleText: "General"),
                                                             HeaderViewCellModel(titleText: "Business"),
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
}
