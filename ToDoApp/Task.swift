//
//  Task.swift
//  ToDoApp
//
//  Created by Rania Arbash on 2025-07-25.
//

import Foundation

class Task {
    var name: String
    var isUrgent: Bool
    var dateCreated: Date
    
    init(name: String, isUrgent: Bool = false, dateCreated: Date = Date()) {
        self.name = name
        self.dateCreated = dateCreated
        self.isUrgent = isUrgent
    }
}

class TaskManager {
    static var shared = TaskManager()
    
    var tasks: [Task] = []
    
    func addTask(ntask: Task) {
        tasks.append(ntask)
    }
    
    func deleteTask(at index: Int) {
        guard index >= 0 && index < tasks.count else {
            return
        }
        tasks.remove(at: index)
    }
}
