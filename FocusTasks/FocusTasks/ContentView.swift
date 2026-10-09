//
//  ContentView.swift
//  FocusTasks
//
//  Created by Jehan Fernando on 2026-10-07.
//

import SwiftUI

struct ContentView: View {
    

    
    var body: some View {
        TabView{
            TasksView()
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }
            
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

//#Preview {
//    ContentView()
//        .environment(TasksViewModel())
//}
