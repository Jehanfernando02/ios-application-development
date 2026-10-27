//
//  ContentView.swift
//  FocusMoviesPrac
//
//  Created by Jehan Fernando on 2026-10-26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        TabView {
            MovieListView()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
            
            FavouritesView()
                .tabItem {
                    Label("Favourites", systemImage: "heart.fill")
                }
        }
        
    }
}


#Preview {
    ContentView()
        .environment(MovieViewModel())
}
