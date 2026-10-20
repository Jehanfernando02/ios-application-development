//
//  MovieListView.swift
//  MovieGenre
//
//  Created by Jehan Fernando on 2026-10-14.
//
//

import SwiftUI

struct MovieListView: View {

    @Environment(UserPreferences.self) private var preferences

    @State private var viewModel   = MovieListViewModel()
    @State private var showAddMovie = false
    @State private var showSettings = false

    private var navigationTitle: String {
        preferences.displayName.isEmpty
            ? "Movie List"
            : "\(preferences.displayName)'s Movies"
    }

    var body: some View {
        @Bindable var vm = viewModel   // needed for $vm.searchText

        NavigationStack {
            List {
                ForEach(viewModel.filteredMovies) { movie in
                    NavigationLink(
                        destination: MovieDetailView(
                            movie: movie,
                            onMarkWatched: { viewModel.markWatched($0) }
                        )
                    ) {
                        MovieRowView(movie: movie)
                    }
                }
                .onDelete { viewModel.deleteMovies(at: $0) }
            }
            .listStyle(.plain)
            .searchable(text: $vm.searchText, prompt: "Search movies…")
            .animation(.default, value: viewModel.filteredMovies.map { $0.id })
            .navigationTitle(navigationTitle)
            .toolbar { toolbarContent }
            .sheet(isPresented: $showAddMovie) {
                AddMovieView { viewModel.addMovie($0) }
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
                Button { showAddMovie = true } label: {
                    Image(systemName: "plus")
                }
                Button { showSettings = true } label: {
                    Image(systemName: "gearshape")
                }
            }
        }
    }
}

// MARK: - Preview
#Preview("Movie List") {
    MovieListView()
}

