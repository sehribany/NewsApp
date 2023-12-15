//
//  APIDecodableResponseRequest.swift
//  DataProvider
//
//  Created by Şehriban Yıldırım on 10.12.2023.
//
//aa76d1da00604d86a1f9cc53cc425ed0
public protocol APIDecodableResponseRequest: DecodableResponseRequest {}

// MARK: - RequestEncoding
public extension APIDecodableResponseRequest {
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

// MARK: - url
public extension APIDecodableResponseRequest {
    var url: String {
        return "https://newsapi.org/v2/top-headlines" + path + "apiKey=aa76d1da00604d86a1f9cc53cc425ed0"
    }
}

// MARK: - RequestParameters
public extension APIDecodableResponseRequest {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
public extension APIDecodableResponseRequest {
    var headers: RequestHeaders {
        return [:]
    }
}
