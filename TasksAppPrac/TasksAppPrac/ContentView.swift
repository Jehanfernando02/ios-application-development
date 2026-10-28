//
//  ContentView.swift
//  TasksAppPrac
//
//  Created by Jehan Fernando on 2026-10-27.
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
