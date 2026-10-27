//
//  AddTaskView.swift
//  TasksApp
//
//  Created by Jehan Fernando on 2026-10-21.
//


import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(TasksViewModel.self) private var viewModel
    
    @Query(sort: \Category.name) private var categories: [Category]
    
    @State private var title: String = ""
    @State private var priority: Priority = .medium
    @State private var category: Category?
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                
                Picker("Priority", selection: $priority) {
                    ForEach(Priority.allCases) { Text($0.rawValue.capitalized).tag($0)
                    }
                }
                
                Picker("Category", selection: $category) {
                    Text("None").tag(Category?.none)
                    
                    ForEach(categories) {
                        Text($0.name.capitalized).tag($0)
                    }
                }
            }
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        viewModel.addTask(title: title, priority: priority, category: category)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddTaskView()
}
