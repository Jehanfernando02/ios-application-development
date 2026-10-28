//
//  TaskViewModel.swift
//  TasksAppPrac
//
//  Created by Jehan Fernando on 2026-10-27.
//

import SwiftData
import Observation

@Observable
final class TasksViewModel {
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func addTask(title: String, priority: Priority, category: Category?) {
        let task = TaskItem(title: title, priority: priority, category: category)
        context.insert(task)
    }
    
    func toggleComplete(_ task: TaskItem) {
        task.isComplete.toggle()
    }


    func addCategory(name: String) {
        let category = Category(name: name)
        context.insert(category)
    }
    
    func delete(_ task: TaskItem) {
        context.delete(task)
    }
    
    func delete(_ category: Category) {
        context.delete(category)
    }
}
