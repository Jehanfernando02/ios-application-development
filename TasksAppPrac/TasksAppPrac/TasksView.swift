//
//  TasksView.swift
//  TasksAppPrac
//
//  Created by Jehan Fernando on 2026-10-27.
//

import SwiftUI
import SwiftData

enum TaskFilter: String, CaseIterable, Identifiable {
    case all
    case active
    case completed
    
    var id: String { rawValue }
}

struct TasksView: View {
    
    
    @State private var showingAddSheet = false
    
    @State private var filter: TaskFilter = .all
    
    var body: some View {
        NavigationStack {
            VStack{
                Picker ("Filter", selection: $filter) {
                    ForEach(TaskFilter.allCases) {
                        Text($0.rawValue.capitalized).tag($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                
                TasksList(filter: filter)
                
            }
            .navigationTitle("Tasks")
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        showingAddSheet = true
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddTaskView()
            }
        }
    }
}


struct TasksList : View {
    
    @Environment(TasksViewModel.self) private var viewModel
    
    @Query private var tasks : [TaskItem]
    
    init(filter: TaskFilter) {
        let showActive = filter != .completed
        let showDone = filter != .active
        
        let predicate = #Predicate<TaskItem> {task in
            (task.isComplete && showDone) || (!task.isComplete && showActive)
        }
        
        _tasks = Query(filter: predicate , sort: \TaskItem.createdAt,
                       order: .reverse)
    }
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                HStack {
                    Button {
                        viewModel.toggleComplete(task)
                    } label: {
                        Image(systemName: task.isComplete ? "checkmark.circle.fill" : "circle")
                    }
                    
                    VStack(alignment: .leading) {
                        Text(task.title)
                            .strikethrough(task.isComplete)
                        
                        if let category = task.category {
                            Text(category.name)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    Spacer()

                    Text(task.priority.rawValue.capitalized)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .onDelete { offsets in
                for index in offsets {
                    let selectedTask = tasks[index]
                    viewModel.delete(selectedTask)
                }
            }
        }
    }
}

#Preview {
    TasksView()
}
