//
//  AddMovieViewModel.swift
//  MovieGenrePrac
//
//  Created by Jehan Fernando on 2026-10-26.
//

import Foundation
import Observation

@Observable
class AddMovieViewModel {
    
    var title = ""
    var selectedGenre = Genre.action
    var rating = 5.0
    var year = Calendar.current.component(.year, from: Date())
    var synopsis = ""
    var duration = 120
    
    var isFormValid: Bool {
        !title.trimmingCharacters(in: .whitespaces).isEmpty &&
        !synopsis.trimmingCharacters(in: .whitespaces).isEmpty &&
        duration > 0
    }

    func buildMovie() -> Movie {
        Movie(
            title: title,
            genre: selectedGenre,
            rating: rating,
            year: year,
            synopsis: synopsis,
            duration: duration)
    }
    
}
