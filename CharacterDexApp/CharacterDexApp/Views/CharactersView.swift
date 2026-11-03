//
//  CharactersView.swift
//  CharacterDexApp
//
//  Created by Jehan Fernando on 2026-11-03.
//

import SwiftUI
import SwiftData

struct CharactersView: View {
    @Environment(CharactersViewModel.self) private var viewModel

    @Query(sort: \CharacterItem.name) private var characters: [CharacterItem]

    var body: some View {
        NavigationStack {
            Group {
                if characters.isEmpty {
                    if let message = viewModel.errorMessage {
                        Text(message)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding()
                    } else {
                        ProgressView()
                    }
                } else {
                    List {
                        ForEach(characters) { character in
                            CharacterRow(character: character)
                        }
                        .onDelete{ offsets in
                            for index in offsets {
                                viewModel.delete(character: characters[index])
                            }
                        }
                    }
                }
            }
            .navigationTitle("Characters")
            .listStyle(.plain)
            .task {
                await viewModel.fetchCharacters()
            }
        }
    }
}

#Preview {
    CharactersView()
}
