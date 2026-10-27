//
//  FocusMoviesPracApp.swift
//  FocusMoviesPrac
//
//  Created by Jehan Fernando on 2026-10-26.
//

import SwiftUI

@main
struct FocusMoviesPracApp: App {
    
    @State private var viewModel = MovieViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
