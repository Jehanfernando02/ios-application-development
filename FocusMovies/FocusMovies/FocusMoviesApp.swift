//
//  FocusMoviesApp.swift
//  FocusMovies
//
//  Created by Jehan Fernando on 2026-10-07.
//

import SwiftUI

@main
struct FocusMoviesApp: App {

    @State private var viewModel = MovieViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
