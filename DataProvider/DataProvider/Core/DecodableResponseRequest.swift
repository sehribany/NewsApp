//
//  DecodableResponseRequest.swift
//  DataProvider
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//

public protocol DecodableResponseRequest : RequestProtocol{
    associatedtype ResponseType : Decodable
}
