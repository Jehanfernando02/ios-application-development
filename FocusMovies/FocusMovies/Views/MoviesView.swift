//
//  MoviesView.swift
//  FocusMovies
//
//  Created by Jehan Fernando on 2026-10-07.
//

import SwiftUI

struct MoviesView: View {

    @Environment(MovieViewModel.self) private var viewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.movies) { movie in

                    HStack {
                        Image(movie.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height:100)
                        
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.headline)

                            Button {
                                viewModel.toggleFavorite(movie: movie)
                            } label: {
                                Image(
                                    systemName: movie.isFavourite
                                    ? "heart.fill"
                                    : "heart"
                                )
                                .foregroundStyle(
                                    movie.isFavourite ? .red : .secondary
                                )
                            }
                        }
                    }
                }
            }
            .navigationTitle("Movies")
        }
    }
}

#Preview {
    MoviesView()
        .environment(MovieViewModel())
}
