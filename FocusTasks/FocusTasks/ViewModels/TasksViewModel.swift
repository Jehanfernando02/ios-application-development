//
//  TasksViewModel.swift
//  FocusTasks
//
//  Created by Jehan Fernando on 2026-10-07.
//

import Observation

@Observable
class TasksViewModel {

    private(set) var tasks: [TaskItem] = [
        TaskItem(title: "Review Literature Notes", priority: .high, isComplete: false),
        TaskItem(title: "Test search field", priority: .medium, isComplete: false),
        TaskItem(title: "Read SwiftUI documentation", priority: .low, isComplete: true),
    ]

    func addNewTask() {
        let newItem = TaskItem(
            title: "Complete FocusTask",
            priority: .high,
            isComplete: false
        )

        tasks.append(newItem)
    }

    func toggleComplete(task: TaskItem) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else {
            return
        }

        tasks[index].isComplete.toggle()
    }

    func completedItemsCount() -> Int {
        return tasks.filter { $0.isComplete }.count
    }
}
