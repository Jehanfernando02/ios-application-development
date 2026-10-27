//
//  TasksAppApp.swift
//  TasksApp
//
//  Created by Jehan Fernando on 2026-10-21.
//

import SwiftUI
import SwiftData

@main
struct TasksAppApp: App {
    private let container: ModelContainer
    @State private var viewModel: TasksViewModel
    
    init() {
        do {
            container = try ModelContainer(for: TaskItem.self, Category.self)
            _viewModel = State(initialValue: TasksViewModel(context: container.mainContext))
        } catch {
            fatalError("Could not create Database: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
        .modelContainer(container)
    }
}
