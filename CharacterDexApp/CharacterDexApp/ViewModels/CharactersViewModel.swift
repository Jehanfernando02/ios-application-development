//
//  CharactersViewModel.swift
//  CharacterDexApp
//
//  Created by Jehan Fernando on 2026-11-03.
//

import Foundation
import SwiftData
import Observation

@MainActor
@Observable
final class CharactersViewModel {
    private let context: ModelContext

    var errorMessage: String?

    init(context: ModelContext) {
        self.context = context
    }

    // MARK: - Fetch (the same 4 steps as the lecture)

    func fetchCharacters() async {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = urlResponse as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                errorMessage = "The server returned an error. Please try again."
                return
            }
            
            let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
            save(response.results)
            errorMessage = nil
            
        } catch {
            if !Task.isCancelled {
                errorMessage = "Could not load characters. Check your internet connection."
            }
        }
        
    }
    
    func delete(character: CharacterItem) {
        context.delete(character)
    }

    // MARK: - Save the downloaded characters into SwiftData

    private func save(_ dtos: [CharacterDTO]) {
        // Which characters do we already have saved?
        let saved = (try? context.fetch(FetchDescriptor<CharacterItem>())) ?? []
        let savedIDs = Set(saved.map { $0.remoteID })

        // Only add the new ones (so we never create duplicates)
        for dto in dtos where !savedIDs.contains(dto.id) {
            context.insert(CharacterItem(dto: dto))
        }

        try? context.save()
    }

    // MARK: - User action

    func toggleFavorite(_ character: CharacterItem) {
        character.isFavorite.toggle()
    }
}
