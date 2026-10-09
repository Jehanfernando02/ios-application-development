//
//  FocusTasksApp.swift
//  FocusTasks
//
//  Created by Jehan Fernando on 2026-10-07.
//

import SwiftUI

@main
struct FocusTasksApp: App {
    @State private var viewModel = TasksViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
