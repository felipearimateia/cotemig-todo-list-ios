//
//  TasksTable.swift
//  TodoList
//
//  Created by COTEMIG on 24/09/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation
import SQLite

struct TasksTable {
    static let id = Expression<String>("id")
    static let idProject = Expression<String>("idProject")
    //        let idStatus = Expression<Int>("idStatus")
    //        let idAccountFrom = Expression<String>("idAccountFrom")
    static let idAccountTo = Expression<String>("idAccountTo")
    static let name = Expression<String>("name")
    static let description = Expression<String>("description")
    static let tags = Expression<String>("tags")
    //        let estimate = Expression<String>("estimate")
    //        let createdAt = Expression<Int64>("createdAt")
    //        let startedAt = Expression<Int64?>("startedAt")
    //        let deliveredAt = Expression<Int64?>("deliveredAt")
    //        let priority = Expression<Int64>("priority")
}
