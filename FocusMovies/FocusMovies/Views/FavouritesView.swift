//
//  FavouritesView.swift
//  FocusMovies
//
//  Created by Jehan Fernando on 2026-10-07.
//

import SwiftUI

struct FavouritesView: View {

    @Environment(MovieViewModel.self) private var viewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.favoriteMovies()) { movie in

                    HStack {
                        Image(movie.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 110)
                            .clipShape(RoundedRectangle(cornerRadius: 8))

                        Text(movie.title)
                            .font(.headline)

                        Spacer()

                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavouritesView()
        .environment(MovieViewModel())
}
