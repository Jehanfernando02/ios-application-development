//
//  CharactersViewModel.swift
//  CharacterDexApp
//
//  Created by Jehan Fernando on 2026-11-03.
//

import Foundation
import SwiftData
import Observation

//@MainActor
@Observable
final class CharactersViewModel {
    
    private let context: ModelContext
    
    var errorMessage: String?
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func fetchCharacters() async {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            
            let (data, urlResponse) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                print("error here")
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("error here")
                return
            }
            
//            characters = try JSONDecoder().decode([CharacterDTO].self, from: data)
            let response = try JSONDecoder().decode(CharacterResponse.self, from: data)

            characters = response.results
            
        } catch {
            print("Something went wrong, please try again",error)
        }
        
    }
    
    
}

