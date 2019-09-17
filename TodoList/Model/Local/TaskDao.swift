//
//  TaskDao.swift
//  TodoList
//
//  Created by Felipe Arimateia on 16/09/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation
import SQLite

public class TaskDao {
    private let database: DatabaseManager
    
    init(_ database: DatabaseManager) {
        self.database = database
    }
    
    func saveTasks(tasks: [TaskResponse]) {
        let stmt = try! database.db.prepare("INSERT OR REPLACE INTO tasks (id, name, idProject, idAccountTo, description, tags) VALUES (?, ?, ?, ?, ?, ?)")
        for task in tasks {
            try! stmt.run(task.id, task.name, task.idProject, task.idAccountTo, task.description, task.tags)
        }
    }
    
    func getTasks() {
        
    }
}
