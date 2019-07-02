//
//  UserApi.swift
//  TodoList
//
//  Created by Felipe Arimateia on 01/07/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation
class UserApi {
    
    private let network: NetworkManager
    
    init(network: NetworkManager) {
        self.network = network
    }
    
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void ) {
        let parameters = ["email" : email, "password": password]
        network.post(path: "/v1/account/auth", parameters: parameters, completion: completion)
    }
    
    func me(token: String,  completion: @escaping (Result<LoginResponse, Error>) -> Void ) {
        network.get(path: "/v1/account/me", headers: ["token": token], completion: completion)
    }
}
