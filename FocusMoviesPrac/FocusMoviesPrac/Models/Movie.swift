//
//  Movie.swift
//  FocusMoviesPrac
//
//  Created by Jehan Fernando on 2026-10-26.
//

import Foundation


enum Genre: String, CaseIterable {
    case action
    case comedy
    case family
    
}

struct Movie: Identifiable {
    let id: UUID
    let title: String
    let genre: Genre
    let imageName: String
    var isFavourite: Bool
    
    init(
        title: String,
        genre: Genre,
        imageName: String,
        isFavourite: Bool
    ) {
        self.id = UUID()
        self.title = title
        self.genre = genre
        self.imageName = imageName
        self.isFavourite = isFavourite
    }
}
