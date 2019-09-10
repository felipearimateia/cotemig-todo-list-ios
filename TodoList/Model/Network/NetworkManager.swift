//
//  NetworkManager.swift
//  TodoList
//
//  Created by Felipe Arimateia on 01/07/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Alamofire

public class NetworkManager {
    
    private let host: String
    private let scheme: String
    
    public init(host: String = "api.fluo.site", scheme: String = "https") {
        self.host = host
        self.scheme = scheme
    }
    
    public func post<T:Decodable>(
        path: String,
        parameters: [String: Any] = [:],
        headers: [String: String] = [:],
        queryItems: [String: String] = [:],
        completion: @escaping (Result<T, Error>)->Void
    ) {
        self.request(.post, path: path, encoding: JSONEncoding.default, parameters: parameters, headers: headers, queryItems: queryItems)
            .responseDecodable (decoder: JSONDecoder()){ (response: DataResponse<T>) in
                debugPrint(response)
                completion(response.result)
        }
    }
    
    public func postEmptyBody(
        path: String,
        parameters: [String: Any] = [:],
        headers: [String: String] = [:],
        queryItems: [String: String] = [:],
        completion: @escaping (Result<Data?, Error>) -> Void
        ) {
        self.request(.post, path: path, encoding: JSONEncoding.default, parameters: parameters, headers: headers, queryItems: queryItems)
            .response { (response) in
                completion(response.result)
        }
    }
    
    public func get<T:Decodable>(
        path: String,
        queryItems: [String: String] = [:],
        headers: [String: String] = [:],
        completion: @escaping (Result<T, Error>)->Void
    ) {
        self.request(.get, path: path, encoding: URLEncoding.default, headers: headers, queryItems: queryItems)
            .responseDecodable (decoder: JSONDecoder()){ (response: DataResponse<T>) in
                debugPrint(response)
                completion(response.result)
        }
    }
    
    private func request(_ method: HTTPMethod, path: String, encoding: ParameterEncoding = JSONEncoding.default,
                         parameters: [String: Any] = [:],
                         headers: [String: String] = [:],
                         queryItems: [String: String] = [:]) -> DataRequest {
        
        let url = createUrl(path, queryItems)
        let requestheaders = createHeards(headers: headers)
        
        let request = AF.request(url!, method: method, parameters: parameters, encoding: encoding, headers: requestheaders, interceptor: nil)
        debugPrint(request)
        return request
    }
    
    private func createHeards(headers: [String: String]) -> HTTPHeaders {
        var httpHeaders = HTTPHeaders(headers)
        httpHeaders.add(.contentType("application/json"))
        return httpHeaders
    }
    
    private func createUrl(_ path: String, _ queryItems: [String: String]) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = self.scheme
        urlComponents.host = self.host
        urlComponents.path = path
        if (queryItems.count > 0) {
            urlComponents.setQueryItems(with: queryItems)
        }
        return try? urlComponents.asURL()
    }
    
}
