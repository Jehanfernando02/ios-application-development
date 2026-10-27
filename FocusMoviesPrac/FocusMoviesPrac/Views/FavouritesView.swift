//
//  FavouritesView.swift
//  FocusMoviesPrac
//
//  Created by Jehan Fernando on 2026-10-26.
//

import SwiftUI

struct FavouritesView: View {
    
    @Environment(MovieViewModel.self) private var viewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (viewModel.favouriteMovies()) { movie in
                
                    HStack {
                        Image(systemName: movie.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 110)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        Text(movie.title)
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                        
                    }
                
                }
            }
            .navigationTitle("Favourite Movies")
            .listStyle(.plain)
        }
    }
    
}


#Preview {
    FavouritesView()
        .environment(MovieViewModel())
}
