//
//  File.swift
//  TasksApp
//
//  Created by Jehan Fernando on 2026-10-21.
//

import Foundation
import SwiftData

// Codable =
enum Priority: String, Codable, CaseIterable, Identifiable {
    case low
    case medium
    case high
    
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
    
    init(
        title: String,
        priority: Priority,
        isComplete: Bool = false,
        createdAt: Date = .now ,
        category: Category? = nil
    ) {
        self.title = title
        self.priority = priority
        self.isComplete = isComplete
        self.createdAt = createdAt
        self.category = category
    }
}


final class Category {
    var name: String
    var tasks: [TaskItem] = []
    
    init(
        name: String,
    ) {
        self.name = name

    }
}
