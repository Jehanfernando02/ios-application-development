//
//  CharacterDexAppApp.swift
//  CharacterDexApp
//
//  Created by Jehan Fernando on 2026-11-01.
//

import SwiftUI
import SwiftData

@main
struct CharacterDexAppApp: App {
    
    private let container: ModelContainer
    @State private var viewModel: CharactersViewModel
    
    init() {
        do {
            container = try ModelContainer(for: CharacterItem.self)
            _viewModel = State(initialValue: CharactersViewModel(context: container.mainContext))
            
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
