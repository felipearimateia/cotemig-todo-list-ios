//
//  ProjectApi.swift
//  TodoList
//
//  Created by Felipe Arimateia on 09/09/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation

class ProjectApi {
    
    private let network: NetworkManager
    
    init(network: NetworkManager) {
        self.network = network
    }
    
    func getProjects(token: String, completion: @escaping(Result<[ProjectResponse], Error>) -> Void) {
        network.get(path: "/v1/project", headers: ["token" : token], completion: completion)
    }
}
