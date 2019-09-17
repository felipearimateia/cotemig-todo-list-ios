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
        
        createTable()
    }
    
    private func createTable() {
        let tasks = getTasks()
        let id = Expression<String>("id")
        let idProject = Expression<String>("idProject")
//        let idStatus = Expression<Int>("idStatus")
//        let idAccountFrom = Expression<String>("idAccountFrom")
        let idAccountTo = Expression<String>("idAccountTo")
        let name = Expression<String>("name")
        let description = Expression<String>("description")
        let tags = Expression<String>("tags")
//        let estimate = Expression<String>("estimate")
//        let createdAt = Expression<Int64>("createdAt")
//        let startedAt = Expression<Int64?>("startedAt")
//        let deliveredAt = Expression<Int64?>("deliveredAt")
//        let priority = Expression<Int64>("priority")
        
        try! db .run(tasks.create(ifNotExists: true) {t in
            t.column(id, primaryKey: true)
            t.column(idProject)
//            t.column(idStatus)
//            t.column(idAccountFrom)
            t.column(idAccountTo)
            t.column(name)
            t.column(description)
            t.column(tags)
//            t.column(estimate)
//            t.column(createdAt)
//            t.column(startedAt)
//            t.column(deliveredAt)
//            t.column(priority)
        })
    }
    
    public func getTasks() -> Table {
        return Table(DatabaseManager.TABLE_TASKS)
    }
}


