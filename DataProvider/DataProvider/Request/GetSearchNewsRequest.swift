//
//  GetSearchNewsRequest.swift
//  DataProvider
//
//  Created by Şehriban Yıldırım on 25.12.2023.
//

public struct GetSearchNewsRequest: APIDecodableResponseRequest{
    
    public typealias ResponseType = News
    
    public var path       : String            = ""
    public var method     : RequestMethod     = .get
    public var parameters : RequestParameters = [:]
    public var headers    : RequestHeaders    = [:]

    public init(page: Int, searchTitle: String){
        self.parameters["page"] = page
        self.path = "?q=\(searchTitle)&"
    }
}
