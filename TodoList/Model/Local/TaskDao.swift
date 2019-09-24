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
    
    func getTasks() -> [TaskResponse] {
        var tasks = [TaskResponse]()
        
        for task in try! database.db.prepare(database.getTasks()) {
            let id = task[TasksTable.id]
            let idProject = task[TasksTable.idProject]
            let idAccountTo = task[TasksTable.idAccountTo]
            let name = task[TasksTable.name]
            let description = task[TasksTable.description]
            let tags = task[TasksTable.tags]
            
            let item = TaskResponse(id: id, name: name, idProject: idProject, idAccountTo: idAccountTo, description: description, tags: tags)
            tasks.append(item)
        }
        
        return tasks
    }
}
