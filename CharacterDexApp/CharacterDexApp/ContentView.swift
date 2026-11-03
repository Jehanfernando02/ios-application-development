//
//  ContentView.swift
//  CharacterDexApp
//
//  Created by Jehan Fernando on 2026-11-01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CharactersView()
                .tabItem {
                    Label("Characters", systemImage: "person.3")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}


#Preview {
    ContentView()
}
