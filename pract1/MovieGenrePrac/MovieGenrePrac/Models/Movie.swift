//Foundation provides common types and functionality, including UUID. SwiftUI provides UI types such as Color.

import Foundation
import SwiftUI

// enum defines a limited set of possible values.
// CaseIterable allows Swift to provide all the cases through Genre.allCases


enum Genre: String, CaseIterable {
    case action = "Action"
    case drama = "Drama"
    case thriller = "Thriller"
    case scifi = "Sci-Fi"
    case comedy = "Comedy"
    
    // Computed Property : determines which string to return based on the current genre.
    // Genre enum contains these cases; self refers to the current enum value
    
    var icon: String {
        switch self {
        case .action: return "flame.fill"
        case .drama: return "theatermasks.fill"
        case .thriller: return "eye.trianglebadge.exclamationmark.fill"
        case .scifi: return "sparkles"
        case .comedy: return "face.smiling.fill"
        }
    }
    
    
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


//  conforms to Identifiable so SwiftUI can identify each movie when iterating through the array.
struct Movie: Identifiable {
    let id: UUID
    var title: String
    var genre: Genre
    var rating: Double
    var year: Int
    var synopsis: String
    var duration: Int
    var isWatched: Bool
    
    // The custom initializer creates the ID automatically and provides a default for isWatched
    
    init(
         title: String,
         genre: Genre,
         rating: Double,
         year: Int,
         synopsis: String,
         duration: Int,
         isWatched: Bool = false
    ) {
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
















