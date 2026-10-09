//
//  Movie.swift
//  FocusMovies
//
//  Created by Jehan Fernando on 2026-10-07.
//

import Foundation

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    var isFavourite: Bool
}
