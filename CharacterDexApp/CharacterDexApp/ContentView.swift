//
//  ContentView.swift
//  CharacterDexApp
//
//  Created by Jehan Fernando on 2026-11-01.
//

import SwiftUI

struct ContentView: View {
    
    @State private var characters: [CharacterDTO] = []
    
    var body: some View {
        NavigationStack {
            Group {
                if characters.isEmpty {
                    ProgressView()
                } else {
                    List {
                        ForEach(characters) {character in
                            VStack {
                                HStack {
                                    Text(character.name + " (" + character.status + ")")
                                        .font(.title2)
                                    Spacer()
                                    
                                    Button {
                                        // Action goes here
                                    } label: {
                                        Image(systemName: "heart.fill")
                                            .foregroundStyle(.red)
                                    }
                                        
                                }
                                Text(character.gender)
                                    .font(.title3)
                                
                                if let url = character.url, !url.isEmpty {
                                    Link("View url", destination: URL(string: url)!)
                                        .foregroundColor(.blue)
                                } else {
                                    Text("No URL available")
                                        .foregroundColor(.gray)
                                }
                              
                            }
                        }
                    }
                }
            }
            .navigationTitle("Characters")
            .listStyle(.plain)
            
            .onAppear {}
            .onDisappear {}
            
            .task {
                await fetchCharacters()
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}
