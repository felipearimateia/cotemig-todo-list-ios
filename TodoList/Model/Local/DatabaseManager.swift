//
//  DatabaseMangaer.swift
//  TodoList
//
//  Created by Felipe Arimateia on 16/09/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import SQLite


public class DatabaseManager {
    public var db: Connection
    
    static let TABLE_TASKS = "tasks"
    
    init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .applicationSupportDirectory, .userDomainMask, true
            ).first! + "/" + Bundle.main.bundleIdentifier!
        
        // create parent directory iff it doesn’t exist
        try! FileManager.default.createDirectory(
            atPath: path, withIntermediateDirectories: true, attributes: nil
        )
        
        db = try! Connection("\(path)/db.sqlite3")
        db.ex
        createTable()
    }
    
    private func createTable() {
        let tasks = getTasks()
        
        try! db.run(tasks.create(ifNotExists: true) {t in
            t.column(TasksTable.id, primaryKey: true)
            t.column(TasksTable.idProject)
//            t.column(TasksTable.idStatus)
//            t.column(TasksTable.idAccountFrom)
            t.column(TasksTable.idAccountTo)
            t.column(TasksTable.name)
            t.column(TasksTable.description)
            t.column(TasksTable.tags)
//            t.column(TasksTable.estimate)
//            t.column(TasksTable.createdAt)
//            t.column(TasksTable.startedAt)
//            t.column(TasksTable.deliveredAt)
//            t.column(TasksTable.priority)
        })
    }
    
    public func getTasks() -> Table {
        return Table(DatabaseManager.TABLE_TASKS)
    }
}


