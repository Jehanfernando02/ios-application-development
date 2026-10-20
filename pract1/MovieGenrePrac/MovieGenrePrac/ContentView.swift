//
//  ContentView.swift
//  MovieGenrePrac
//
//  Created by Jehan Fernando on 2026-10-19.
//

import SwiftUI
import Observation

enum Genre: String, CaseIterable {
    case action = "Action"
    case drama = "Drama"
    case thriller = "Thriller"
    case scifi = "Sci-Fi"
    case comedy = "Comedy"
}


struct Movie: Identifiable {
    let id: UUID
    var title: String
    var genre: Genre
    var rating: Double
    var year: Int
    var synopsis: String
    var duration: Int
    var isWatched: Bool
    
}

#Preview {
    ContentView()
}
