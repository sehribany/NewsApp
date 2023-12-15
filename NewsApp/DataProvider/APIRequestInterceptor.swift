//
//  APIRequestInterceptor.swift
//  NewsApp
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//

import Alamofire

public class APIRequestInterceptor: RequestInterceptor {
    
    public static let shared = APIRequestInterceptor()
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest  = urlRequest
        completion(.success(urlRequest))
    }
}
