//
//  GetNewsRequest.swift
//  DataProvider
//
//  Created by Şehriban Yıldırım on 11.12.2023.
//

public enum ListingType {
    case general
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
        case .general:
            path = "/sources?category=general&"
        case .business:
            path = "/sources?category=business&"
        case .entertainment:
            path = "/sources?category=entertainment&"
        case .health:
            path = "/sources?category=health&"
        case .science:
            path = "/sources?category=science&"
        case .sports:
            path = "/sources?category=sports&"
        case .technology:
            path = "/sources?category=technology&"            
        }
    }
}



//https://newsapi.org/v2/top-headlines  ?country=us&  apiKey=aa76d1da00604d86a1f9cc53cc425ed0                 -Ülkeye göre haber
//https://newsapi.org/v2/top-headlines  ?q=Israel&    apiKey=aa76d1da00604d86a1f9cc53cc425ed0                 -Anahtar kelimeye göre
//https://newsapi.org/v2/top-headlines  /sources?category=business&  apiKey=aa76d1da00604d86a1f9cc53cc425ed0  -Category

