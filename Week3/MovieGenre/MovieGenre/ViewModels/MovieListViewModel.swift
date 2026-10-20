//
//  MovieListViewModel.swift
//  MovieGenre
//
//  Created by Jehan Fernando on 2026-10-14.
//

import Foundation
import Observation

@Observable

class MovieListViewModel {
    var movies: [Movie] = MockDataStore.movies
    
    var searchText: String = ""
    
    var filteredMovies: [Movie] { filter(movies) }
    
    func filter(_ movies: [Movie]) -> [Movie] {
        guard !searchText.isEmpty else { return movies }
        return movies.filter {
            $0.title.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    
    // (Movie) -> Void
    func markWatched(_ movie: Movie) {
        if let index = movies.firstIndex(where: { $0.id == movie.id }) {
            movies[index].isWatched = true
        }
    }
    
    
    func addMovie(_ movie: Movie) {
        movies.append(movie)
    }
    
    // Intent: swipe-to-delete (works on filtered list)
    func deleteMovies(at offsets: IndexSet) {
        let filtered = filteredMovies
        for i in offsets {
            movies.removeAll { $0.id == filtered[i].id }
        }
        
    }
    
}
