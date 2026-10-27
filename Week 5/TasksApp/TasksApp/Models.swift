//
//  Models.swift
//  TasksApp
//
//  Created by Jehan Fernando on 2026-10-21.
//

import Foundation
import SwiftData

enum Priority: String, Codable, CaseIterable, Identifiable {
    case low, medium, high
    
    var id: String {
        rawValue
    }
}

@Model
final class TaskItem {
    var title: String
    var priority: Priority
    var isComplete: Bool
    var createdAt: Date
    var category: Category?
    
    init(title: String,
         priority: Priority,
         isComplete: Bool = false,
         createdAt: Date = .now,
         category: Category? = nil) {
        self.title = title
        self.priority = priority
        self.isComplete = isComplete
        self.createdAt = createdAt
        self.category = category
    }
}

@Model
final class Category {
    var name: String
    
    // when a category is deleted it should delete all tasks of that category
    // nullify
    // noAction
    // deny
    // cascade
    @Relationship(deleteRule: .cascade, inverse: \TaskItem.category)
    var tasks: [TaskItem] = []
    
    init(name: String) {
        self.name = name
    }
}

