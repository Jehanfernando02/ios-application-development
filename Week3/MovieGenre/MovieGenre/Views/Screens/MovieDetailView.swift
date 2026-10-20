//
//  MovieDetailView.swift
//  MovieGenre
//
//  Created by Jehan Fernando on 2026-10-14.
//


import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    // Callback so the parent ViewModel can update isWatched
    var onMarkWatched: ((Movie) -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                MovieDetailHeaderView(movie: movie)
                MovieDetailMetaView(movie: movie)
                MovieDetailSynopsisView(movie: movie)
                MovieDetailActionView(movie: movie, onMarkWatched: onMarkWatched)
            }
            .padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: - Header: genre badge + rating + watched badge
struct MovieDetailHeaderView: View {
    let movie: Movie

    var body: some View {
        HStack(spacing: 12) {
            GenreBadgeView(genre: movie.genre, size: 64, iconSize: 28)

            VStack(alignment: .leading, spacing: 4) {
                Text(movie.genre.rawValue.uppercased())
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(movie.genre.color)
                    .tracking(1.2)
                RatingView(rating: movie.rating, showOutOfTen: true)
                    .font(.title3)
            }

            Spacer()

            if movie.isWatched {
                VStack(spacing: 2) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.title2)
                    Text("Watched")
                        .font(.caption2)
                        .foregroundColor(.green)
                }
            }
        }
    }
}

// MARK: - Meta strip: year + duration
struct MovieDetailMetaView: View {
    let movie: Movie

    // Converts raw minutes into "2h 32m" format
    var formattedDuration: String {
        let hours   = movie.duration / 60
        let minutes = movie.duration % 60
        return hours > 0 ? "\(hours)h \(minutes)m" : "\(minutes)m"
    }

    var body: some View {
        HStack(spacing: 0) {
            MetaInfoTileView(icon: "calendar", label: "Year",     value: String(movie.year))
            Divider().frame(height: 36)
            MetaInfoTileView(icon: "clock",    label: "Duration", value: formattedDuration)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// MARK: - Synopsis block
struct MovieDetailSynopsisView: View {
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Synopsis")
                .font(.headline)
            Text(movie.synopsis)
                .font(.body)
                .foregroundColor(.secondary)
                .lineSpacing(4)
        }
    }
}

// MARK: - Action: Mark as Watched button
struct MovieDetailActionView: View {
    let movie: Movie
    var onMarkWatched: ((Movie) -> Void)?

    var body: some View {
        if !movie.isWatched {
            Button {
                onMarkWatched?(movie)
            } label: {
                Label("Mark as Watched", systemImage: "checkmark.circle")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .font(.headline)
            }
        }
    }
}

// MARK: - Previews
#Preview("Complete Detail") {
    MovieDetailView(
        movie: MockDataStore.movies[0],
        onMarkWatched: { movie in
            print("Marked as watched: \(movie.title)")
        }
    )
}

#Preview("Detail Header") {
    MovieDetailHeaderView(movie: MockDataStore.movies[2])
        .padding()
}

#Preview("Detail Metadata") {
    MovieDetailMetaView(movie: MockDataStore.movies[2])
        .padding()
}

#Preview("Synopsis") {
    MovieDetailSynopsisView(movie: MockDataStore.movies[2])
        .padding()
}

#Preview("Action - Unwatched") {
    MovieDetailActionView(
        movie: MockDataStore.movies[0],
        onMarkWatched: { movie in
            print("Marked as watched: \(movie.title)")
        }
    )
    .padding()
}

#Preview("Action - Already Watched") {
    MovieDetailActionView(movie: MockDataStore.movies[1])
        .padding()
}
