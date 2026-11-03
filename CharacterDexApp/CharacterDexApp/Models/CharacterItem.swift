//
//  CharacterItem.swift
//  CharacterDexApp
//
//  Created by Jehan Fernando on 2026-11-03.
//

import Foundation
import SwiftData

@Model
final class CharacterItem {
    var remoteId: Int
    var name: String
    var status: String
    var species: String
    var imageURL: String
    var isFavorite: Bool
    
    init(dto: CharacterDTO) {
        self.remoteId = dto.id
        self.name = dto.name
        self.status = dto.status
        self.species = dto.species
        self.imageURL = dto.imageURL
        self.isFavorite = false
    }
}
