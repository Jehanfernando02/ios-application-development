//
//  MovieViewModel.swift
//  FocusMoviesPrac
//
//  Created by Jehan Fernando on 2026-10-26.
//

import Foundation
import Observation

@Observable
class MovieViewModel {
    var movies: [Movie] = MockDataStore.movies
    
    func addFavourite(movie: Movie) {
        if let index = movies.firstIndex(where: {$0.id == movie.id}
        ) {
            movies[index].isFavourite = true
        }else {
            return
        }
    
    }
    
    func favouriteMovies() -> [Movie] {
        return movies.filter( { $0.isFavourite } )
    }
}
