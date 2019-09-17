//
//  TaskRepository.swift
//  TodoList
//
//  Created by COTEMIG on 13/08/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation
import SQLite

class TaskRepository {
    private let taskApi: TaskApi
    private let userRepository: UserRepository
    private let taskDao: TaskDao
    
    private init(_ taskApi: TaskApi, taskDao: TaskDao) {
        self.taskApi = taskApi
        self.userRepository = UserRepository.factory()
        self.taskDao = taskDao
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
    
    func getUserTasks(token: String, completion: @escaping ([TaskResponse]) -> Void) {
        taskApi.getUserTasks(token: token) { (result) in
            switch result {
            case .success(let tasks):
                self.taskDao.saveTasks(tasks: tasks)
                completion(tasks)
            case .failure:
                completion([])
            }
        }
    }
    
    static func factory() -> TaskRepository {
        let network = NetworkManager()
        let api = TaskApi(network: network)
        let dao = TaskDao(DatabaseManager())
        return TaskRepository(api, taskDao: dao)
    }
}
