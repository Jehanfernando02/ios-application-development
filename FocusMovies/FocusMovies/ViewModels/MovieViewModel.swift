//
//  MovieViewModel.swift
//  FocusMovies
//
//  Created by Jehan Fernando on 2026-10-07.
//

import Observation

@Observable
class MovieViewModel{
    
    private(set) var movies: [Movie] = [
        Movie(title: "Joker", imageName: "movie3", isFavourite: true),
        Movie(title: "Shrek", imageName: "movie2", isFavourite: true),
        Movie(title: "Johnny English", imageName: "movie5", isFavourite: false)
    ]
    
    func toggleFavorite(movie: Movie) {
        guard let index = movies.firstIndex(where: { $0.id == movie.id }) else {
            return
        }

        movies[index].isFavourite.toggle()
    }

    func favoriteMovies() -> [Movie] {
        return movies.filter { $0.isFavourite }
    }
}
