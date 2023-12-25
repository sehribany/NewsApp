//
//  GetNewsRequest.swift
//  DataProvider
//
//  Created by Şehriban Yıldırım on 11.12.2023.
//

public enum ListingType : Int {
    case business
    case entertainment
    case health
    case science
    case sports
    case technology
}

public struct GetNewsRequest: APIDecodableResponseRequest{
    
    public typealias ResponseType = News
    
    public var path       : String            = ""
    public var method     : RequestMethod     = .get
    public var parameters : RequestParameters = [:]
    public var headers    : RequestHeaders    = [:]
    public let listingType: ListingType
    
    public init(page: Int, listingType: ListingType) {
        self.parameters["page"] = page
        self.listingType        = listingType
        
        switch listingType {
        case .business:
            path = "?country=us&category=business&"
        case .entertainment:
            path = "?country=us&category=entertainment&"
        case .health:
            path = "?country=us&category=health&"
        case .science:
            path = "?country=us&category=science&"
        case .sports:
            path = "?country=us&category=sports&"
        case .technology:
            path = "?country=us&category=technology&"
        }
    }
}
