//
//  TaskApi.swift
//  TodoList
//
//  Created by COTEMIG on 13/08/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation

class TaskApi {
    
    private let network: NetworkManager
    
    init(network: NetworkManager) {
        self.network = network
    }
    
    func getTasksByProject(idProject: String, token: String, completion: @escaping (Result<Array<TaskResponse>, Error>) -> Void) {
        network.get(path: "/v1/project/\(idProject)/tasks", headers:["token": token], completion: completion)
    }
}
