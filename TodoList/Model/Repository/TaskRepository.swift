//
//  TaskRepository.swift
//  TodoList
//
//  Created by COTEMIG on 13/08/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation

class TaskRepository {
    private let taskApi: TaskApi
    private let userRepository: UserRepository
    
    private init(_ taskApi: TaskApi) {
        self.taskApi = taskApi
        self.userRepository = UserRepository.factory()
    }
    
    func getTasksByProject(_ idProject: String, callback:@escaping (Array<TaskResponse>?, Bool) -> Void) {
        
        if let token = userRepository.getToken() {
            taskApi.getTasksByProject(idProject: idProject, token: token) { (result) in
                
                switch result {
                case .success(let tasks):
                    callback(tasks, false)
                case .failure( _):
                    callback(nil, false)
                }
            }
        } else {
            callback(nil, true)
        }
    }
    
    static func factory() -> TaskRepository {
        let network = NetworkManager()
        let api = TaskApi(network: network)
        return TaskRepository(api)
    }
}
