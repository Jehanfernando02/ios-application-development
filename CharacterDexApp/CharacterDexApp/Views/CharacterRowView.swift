//
//  CharacterRowView.swift
//  CharacterDexApp
//
//  Created by Jehan Fernando on 2026-11-03.
//

import SwiftUI

struct CharacterRow: View {
    @Environment(CharactersViewModel.self) private var viewModel

    let character: CharacterItem

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: character.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                Text("\(character.species) • \(character.status)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button {
                viewModel.toggleFavorite(character)
            } label: {
                Image(systemName: character.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(character.isFavorite ? .red : .secondary)
            }
            .buttonStyle(.borderless)
        }
    }
}

