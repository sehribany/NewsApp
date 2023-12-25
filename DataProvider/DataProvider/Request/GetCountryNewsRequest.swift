//
//  GetCountryNewsRequest.swift
//  DataProvider
//
//  Created by Şehriban Yıldırım on 16.12.2023.
//

public struct GetCountryNewsRequest: APIDecodableResponseRequest{
    
    public typealias ResponseType = News
    
    public var path       : String            = ""
    public var method     : RequestMethod     = .get
    public var parameters : RequestParameters = [:]
    public var headers    : RequestHeaders    = [:]

    public init(page: Int){
        self.parameters["page"] = page
        self.path = "?country=us&"
    }
}
