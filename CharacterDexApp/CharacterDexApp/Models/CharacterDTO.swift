import Foundation

/*
 {
       "id": 1,
       "name": "Rick Sanchez",
       "status": "Alive",
       "species": "Human",
       "type": "",
       "gender": "Male",
       "origin": {
         "name": "Earth (C-137)",
         "url": "https://rickandmortyapi.com/api/location/1"
       },
       "location": {
         "name": "Citadel of Ricks",
         "url": "https://rickandmortyapi.com/api/location/3"
       },
       "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
       "episode": [
         "https://rickandmortyapi.com/api/episode/1",
         // rest
         "https://rickandmortyapi.com/api/episode/51"
       ],
       "url": "https://rickandmortyapi.com/api/character/1",
       "created": "2017-11-04T18:48:46.250Z"
     },
 */


struct CharacterDTO: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let gender: String
    let url: String?
    let species: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case gender
        case url
        case species
        case imageURL = "image"
    }
}

struct CharacterResponse: Codable {
    let results: [CharacterDTO]
}
