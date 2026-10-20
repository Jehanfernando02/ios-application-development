//
//  TaskItem.swift
//  FocusTasks
//
//  Created by Jehan Fernando on 2026-10-07.
//

import Foundation

// Identifiable lets SwiftUI identify individual tasks.
struct TaskItem: Identifiable {
    var id = UUID()
    var title: String
    var priority: Priority
    var isComplete: Bool
}
