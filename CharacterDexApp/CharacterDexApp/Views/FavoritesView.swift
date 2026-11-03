//
//  FavoritesView.swift
//  CharacterDexApp
//
//  Created by Jehan Fernando on 2026-11-03.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {

    @Query(
        filter: #Predicate<CharacterItem> { $0.isFavorite },
        sort: \CharacterItem.name
    )
    private var favorites: [CharacterItem]

    var body: some View {
        NavigationStack {
            Group {
                if favorites.isEmpty {
                    Text("No favorites yet.\nTap the heart on a character.")
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                } else {
                    List {
                        ForEach(favorites) { character in
                            CharacterRow(character: character)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}


#Preview {
    FavoritesView()
}
