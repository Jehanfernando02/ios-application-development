//
//  ContentView.swift
//  FocusMovies
//
//  Created by Jehan Fernando on 2026-10-07.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {

            MoviesView()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }

            FavouritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(MovieViewModel())
}
