//
//  DataProviderProtocol.swift
//  DataProvider
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//

public typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)

public protocol DataProviderProtocol{
    
    func request<T: DecodableResponseRequest>(for request: T,
                                              result: DataProviderResult<T.ResponseType>?)
}
