//
//  TasksView.swift
//  FocusTasks
//
//  Created by Jehan Fernando on 2026-10-07.
//

import SwiftUI
import Observation

enum Priority: String {
    case low
    case medium
    case high
}

//Protocol Identifiable to have id, since title, priority, isComplete is not suitable
struct TaskItem: Identifiable {
    var id = UUID()
    var title: String
    var priority: Priority
    var isComplete: Bool
}

@Observable
class TasksViewModel {
    private(set) var tasks: [TaskItem] = [
        TaskItem(title: "Review Literature Notes", priority: .high, isComplete: false),
        TaskItem(title: "Test search field", priority: .medium, isComplete: false),
        TaskItem(title: "Read SwiftUI documentation", priority: .low, isComplete: true),
    ]
    
     func addNewTask() {
        let newItem = TaskItem( title: "Complete FocusTask", priority: .high,
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
    
}

struct TasksView: View {
    
    @State private var viewModel = TasksViewModel()
    
    
    
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
}
