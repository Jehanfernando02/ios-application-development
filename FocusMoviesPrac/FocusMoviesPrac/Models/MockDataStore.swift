//
//  MockDataStore.swift
//  FocusMoviesPrac
//
//  Created by Jehan Fernando on 2026-10-26.
//

import Foundation

struct MockDataStore {
    static let movies: [Movie] = [
        Movie(
            title: "Mr.Bean",
            genre: .comedy,
            imageName: "movie1",
            isFavourite: true
        ),
        Movie(
            title: "Shark",
            genre: .action,
            imageName: "movie2",
            isFavourite: false
        ),
        Movie(
            title: "Joker",
            genre: .comedy,
            imageName: "movie3",
            isFavourite: false
        ),
        Movie(
            title: "Shrek",
            genre: .family,
            imageName: "movie4",
            isFavourite: true
        )
    ]
}
