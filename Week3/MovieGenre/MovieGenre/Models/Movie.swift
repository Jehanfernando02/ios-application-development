//
//  Movie.swift
//  MovieGenre
//
//  Created by Jehan Fernando on 2026-10-14.
//

import SwiftUI

// MARK: - Movie Model
// A plain Swift struct. Identifiable so SwiftUI can iterate it safely.
struct Movie: Identifiable {
    let id: UUID
    var title: String
    var genre: Genre
    var rating: Double
    var year: Int
    var synopsis: String
    var duration: Int
    var isWatched: Bool

    init(title: String, genre: Genre, rating: Double,
         year: Int, synopsis: String, duration: Int,
         isWatched: Bool = false) {
        self.id = UUID()
        self.title = title
        self.genre = genre
        self.rating = rating
        self.year = year
        self.synopsis = synopsis
        self.duration = duration
        self.isWatched = isWatched
    }
}

// MARK: - Genre Enum
// All domain knowledge about genres lives here (DRY principle).
enum Genre: String, CaseIterable {
    case action = "Action"
    case drama = "Drama"
    case thriller = "Thriller"
    case scifi = "Sci-Fi"
    case comedy = "Comedy"

    // SF Symbol name for each genre
    var icon: String {
        switch self {
        case .action:
            return "flame.fill"
        case .drama:
            return "theatermasks.fill"
        case .thriller:
            return "eye.trianglebadge.exclamationmark.fill"
        case .scifi:
            return "sparkles"
        case .comedy:
            return "face.smiling.fill"
        }
    }

    // Brand colour for each genre — single source of truth
    var color: Color {
        switch self {
        case .action: return .red
        case .drama: return .purple
        case .thriller: return .orange
        case .scifi: return .blue
        case .comedy: return .yellow
        }
    }
}
