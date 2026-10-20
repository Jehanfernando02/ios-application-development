//
//  MovieGenreApp.swift
//  MovieGenre
//
//  Created by Jehan Fernando on 2026-10-14.
//

import SwiftUI

@main
struct MovieGenreApp: App {
    
    @State private var preferences = UserPreferences()
    
    var body: some Scene {
        WindowGroup {
            MovieListView()
            .environment(preferences)
            .preferredColorScheme(preferences.preferredColorScheme) 
        }
    }
}
