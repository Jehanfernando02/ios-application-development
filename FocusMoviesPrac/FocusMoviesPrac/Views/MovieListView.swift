//
//  MovieListView.swift
//  FocusMoviesPrac
//
//  Created by Jehan Fernando on 2026-10-26.
//

import SwiftUI

struct MovieListView: View {
    
    @Environment(MovieViewModel.self) private var viewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.movies) { movie in
                    
                    HStack (spacing: 8) {
                        Image(movie.imageName)
                            .resizable()
                            .frame(width: 80, height: 100)
                            .scaledToFit()
                        
                        VStack(alignment:.leading , spacing: 4) {
                            Text(movie.title)
                                .font(.headline)
                            
                            Button {
                                viewModel.addFavourite(movie: movie)
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
            .listStyle(.plain)
            .navigationTitle("Movie List")
        }
    }
}
#Preview{
    MovieListView()
        .environment(MovieViewModel())
}
