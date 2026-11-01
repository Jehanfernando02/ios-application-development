//
//  ContentView.swift
//  NetworkingPrac
//
//  Created by Jehan Fernando on 2026-11-01.
//

import SwiftUI

struct ContentView: View {
    
    @State private var movies: [MovieDTO] = []
    
    var body: some View {
        NavigationStack {
            Group {
                if movies.isEmpty {
                    ProgressView()
                } else {
                    List {
                        ForEach(movies) { movie in
                            VStack {
                                Text(movie.title)
                                    .font(.title)
                                Text(movie.releaseDate)
                                    .font(.caption)
                                Text(movie.description).multilineTextAlignment(.leading)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Ghibli Films")
            .onAppear {
                //                Task {
                //                    await fetchMovies()
                //                }
            }
            .onDisappear {}
            
            .task {
                await fetchMovies()
            }
        }
    }
    
    
    func fetchMovies() async {
        guard let url = URL(string: "https://ghibliapi.vercel.app/films") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                return
            }
            
            movies = try JSONDecoder().decode([MovieDTO].self, from: data)
            
        } catch {
            print("Something went wrong, please try again",error)
        }
        
    }
}


#Preview {
    ContentView()
}
