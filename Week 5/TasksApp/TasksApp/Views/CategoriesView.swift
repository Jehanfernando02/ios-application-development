//
//  CategoriesView.swift
//  TasksApp
//
//  Created by Jehan Fernando on 2026-10-21.
//

import SwiftUI
import SwiftData

struct CategoriesView: View {
    @Environment(TasksViewModel.self) private var viewModel

    @Query(sort: \Category.name) private var categories: [Category]
    
    @State private var categoryTitle = ""
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    HStack {
                        TextField("New category", text: $categoryTitle)
                        
                        Button("Add") {
                            viewModel.addCategory(name: categoryTitle)
                            categoryTitle = ""
                        }
                        .disabled(categoryTitle.isEmpty)
                    }
                }
                
                Section {
                    ForEach(categories) { category in
                        LabeledContent(category.name.capitalized, value: "\(category.tasks.count) tasks ")
                    }
                    .onDelete { offsets in
                        for index in offsets {
                            let selectedCategory = categories[index]
                            viewModel.delete(selectedCategory)
                        }
                    }
                }
            }
            .navigationTitle("Categories")
        }
    }
}
