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
    
    func getUserTasks(token: String, completion: @escaping(Result<[TaskResponse], Error>) -> Void) {
        network.get(path: "/v1/account/tasks", headers: ["token" : token], completion: completion)
    }
    
    func newTask(token: String, name: String, idProject: String, idAccountTo: String, tags: String, completion: @escaping (Result<Data?, Error>) -> Void) {
        let parameters = ["name" : name, "idProject": idProject, "idAccountTo": idAccountTo, "description": name, "tags": tags]
        network.postEmptyBody(path: "/v1/task", parameters: parameters, headers:["token" : token], completion: completion)
    }
}
