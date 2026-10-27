
import SwiftUI


/*
 ### 📖 Theory: what is a closure?

 The detail screen declares:

 var onMarkWatched: ((Movie) -> Void)?

 Read the type from the inside out:

 - `(Movie) -> Void` is a **function type**: it accepts a `Movie` and returns no meaningful value.
 - The outer parentheses group that function type.
 - The trailing `?` makes the closure **optional**.

 The detail screen can receive a function from its parent. It doesn't need to know the implementation of that function.

 When the button is pressed:

 onMarkWatched?(movie)

 The `?` here is **optional chaining**. It calls the closure only if a closure was provided. If the optional is `nil`, nothing happens.

 The parent supplies a closure that calls the ViewModel. This preserves the tutorial's rule that the **ViewModel, not the detail view, changes the movie list**.
 */

struct MovieDetailView: View {
    
    let movie: Movie
    var onMarkWatched: ((Movie) -> Void)? // Callback so the parent ViewModel can update isWatched
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                MovieDetailHeaderView(movie: movie)
                MovieDetailMetaView(movie: movie)
//                MovieDetailSynopsisView(movie: movie)
//                MovieDetailActionView(movie: movie, onMarkWatched: onMarkWatched)
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
        HStack (spacing: 12) {
            GenreBadgeView (
                genre: movie.genre,
                size: 64,
                iconSize: 28)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.genre.rawValue.uppercased())
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(movie.genre.color)
                
                RatingView(
                    rating: movie.rating,
                    showOutOfTen: true
                )
                .font(.title3)
            }
            
            Spacer()
            
            if movie.isWatched {
                VStack(spacing: 2) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                    
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
    
    var formattedDuration : String {
        let hours = movie.duration / 60
        let minutes = movie.duration % 60
        
        return hours > 0
        ? "\(hours)h \(minutes)m"
        : "\(minutes)m"
    }
    
    var body: some View {
        HStack (spacing: 12) {
            MetaInfoTileView(
                icon: "calendar",
                label: "Year",
                value: String(movie.year)
            )
            
            Divider()
                .frame(height: 36)
            
            MetaInfoTileView(
                icon: "clock",
                label: "Duration",
                value: formattedDuration
            )
            
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
}
        
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

// MARK: - Action
struct MovieDetailActionView: View {
    let movie: Movie
    var onMarkWatched: ((Movie) -> Void)?

    var body: some View {
        if !movie.isWatched {
            Button {
                onMarkWatched?(movie)
            } label: {
                Label(
                    "Mark as Watched",
                    systemImage: "checkmark.circle"
                )
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
