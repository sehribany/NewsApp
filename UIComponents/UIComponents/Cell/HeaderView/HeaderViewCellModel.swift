//
//  HeaderViewCellModel.swift
//  UIComponents
//
//  Created by Şehriban Yıldırım on 22.12.2023.
//

public protocol HeaderViewCellDataSource: AnyObject {
    var titleText       : String {get}
}

public protocol HeaderViewCellEventSource: AnyObject {}

public protocol HeaderViewCellProtocol: HeaderViewCellDataSource, HeaderViewCellEventSource {}

public final class HeaderViewCellModel: HeaderViewCellProtocol {
    public var titleText      : String
    
    public init(titleText: String) {
        self.titleText       = titleText
    }
}
