//
//  ContentView.swift
//  TasksApp
//
//  Created by Jehan Fernando on 2026-10-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TasksView()
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "folder")
                }
        }
    }
}

#Preview {
    ContentView()
}
