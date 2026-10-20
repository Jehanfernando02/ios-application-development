//
//  MovieRowView.swift
//  MovieGenre
//
//  Created by Jehan Fernando on 2026-10-14.
//


import SwiftUI

struct MovieRowView: View {
    let movie: Movie

    var body: some View {
        HStack(spacing: 12) {
            GenreBadgeView(genre: movie.genre, size: 44, iconSize: 18)
            movieInfo
            Spacer()
            trailingInfo
        }
        .padding(.vertical, 4)
    }

    // Left column: title + genre · year
    private var movieInfo: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(movie.title)
                .font(.headline)
                // Dim the title if already watched — visual at-a-glance status
                .foregroundColor(movie.isWatched ? .secondary : .primary)

            HStack(spacing: 6) {
                Text(movie.genre.rawValue)
                    .font(.caption).foregroundColor(.secondary)
                Text("•")
                    .font(.caption).foregroundColor(.secondary)
                Text(String(movie.year))
                    .font(.caption).foregroundColor(.secondary)
            }
        }
    }

    // Right column: rating + watched checkmark
    private var trailingInfo: some View {
        VStack(alignment: .trailing, spacing: 4) {
            RatingView(rating: movie.rating)
                .font(.caption2)
            if movie.isWatched {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.caption)
            }
        }
    }
}

// MARK: - Previews
#Preview("Unwatched Movie") {
    MovieRowView(movie: MockDataStore.movies[0])
        .padding()
}

#Preview("Watched Movie") {
    MovieRowView(movie: MockDataStore.movies[1])
        .padding()
}
