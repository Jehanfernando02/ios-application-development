//
//  TasksView.swift
//  FocusTasks
//
//  Created by Jehan Fernando on 2026-10-07.
//

import SwiftUI

struct TasksView: View {
    
//    @Bindable var viewModel: TasksViewModel
    @Environment(TasksViewModel.self) private var viewModel
    
    
    var body: some View {
        List {
            ForEach(viewModel.tasks) {task in
                HStack {
                    
                    Button {
                        viewModel.toggleComplete(task: task)
                    } label: {
                        Image(systemName: task.isComplete ? "checkmark.circle.fill" : "circle")
                    }
                    
                    Text(task.title)
                        .strikethrough(task.isComplete)
                    
                    Spacer()
                    
                    Text(task.priority.rawValue.capitalized)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                }
            }
            
            Button {
                viewModel.addNewTask()
            } label: {
                Text("Add New")
            }
        }
    }
    

        
//        tasks.firstIndex { loopItem in
//            loopItem.id == task.id
//        }
        
//        tasks[index].isComplete.toggle()
    
//    let newItem = TaskItem(
//        title: "Complete FocusTask", priority: .high,
//        isComplete: false
//    )
//    
//    let optionalIndex: Int? = nil
////        optionalIndex = 4
//                            
//        // force unwrap
//        tasks[index] = newItem
//        
//        //if let
//        if let unwrappedIndex = optionalIndex {
//            tasks[unwrappedIndex] = newItem()
//        } else {
//            print("no value")
//        }
//        
//        //guard let
//        guard let unwrappedIndex = optionalIndex else { return }
//        tasks[unwrappedIndex] = NewItem()
//        
//    }
    
}

#Preview {
    TasksView()
        .environment(TasksViewModel())
}
