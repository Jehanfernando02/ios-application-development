//
//  MovieListView.swift
//  MovieGenrePrac
//
//  Created by Jehan Fernando on 2026-10-20.
//

import SwiftUI

struct MovieListView: View {
    
    @Environment(UserPreferences.self) private var preferences
    
    @State private var viewModel = MovieListViewModel()
    @State private var showAddMovie = false
    @State private var showSettings = false
    
    private var navigationTitle: String {
        preferences.displayName.isEmpty
        ? "Movie List"
        : "\(preferences.displayName) 's Movies"
    }
    
    var body: some View {
        
        @Bindable var vm = viewModel
        
        NavigationStack {
            List {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(
                        destination: MovieDetailView(
                            movie: movie,
                            onMarkWatched: {
                                viewModel.markWatched($0)
                            }
                        )
                    ) {
                        MovieRowView(movie: movie)
                    }
                }
                .onDelete {
                    viewModel.deleteMovies(at: $0)
                }
            }
            .listStyle(.plain)
            .searchable(text: $vm.searchText,
                        prompt: "Search Movies"
            )
            .animation(
                .default,
                value: viewModel.filteredMovies.map { $0.id }
            )
            .navigationTitle(navigationTitle)
            .toolbar {
                toolbarContent
            }
            
            .sheet(isPresented: $showAddMovie) {
                AddMovieView {
                    viewModel.addMovie(movie: $0)
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsSheetView()
            }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack(spacing: 16) {
                Button {
                    showAddMovie = true
                } label: {
                    Image(systemName: "plus")
                }
                
                
                Button {
                    showSettings = true
                } label: {
                    Image(systemName: "gearshape")
                }
            }
        }
    }
    
    
    
}
#Preview("Movie List") {
    MovieListView()
        .environment(UserPreferences())
}



/*
 ### 📖 Theory: how does the closure connect the detail view to the ViewModel?

 This is the most important line:

 ```swift
 onMarkWatched: {
     viewModel.markWatched($0)
 }
 ```

 The parent constructs the detail view and passes it a closure. When the detail screen calls that closure, the parent calls `markWatched`.

 The `$0` is shorthand for the closure's first argument, which is a `Movie`.

 The equivalent explicit version is:

 ```swift
 onMarkWatched: { movie in
     viewModel.markWatched(movie)
 }
 ```

 Both mean the same thing. The explicit version is easier to understand when you're still learning closures, so use it while practising if needed.

 ### 📖 Why does the ViewModel method take a movie?

 ```swift
 func markWatched(_ movie: Movie)
 ```

 The underscore means the caller doesn't need to write the external argument label. You can call it like this:

 ```swift
 viewModel.markWatched(movie)
 ```

 rather than:

 ```swift
 viewModel.markWatched(movie: movie)
 ```

 Both are valid Swift API styles; the tutorial uses the former.
 */
