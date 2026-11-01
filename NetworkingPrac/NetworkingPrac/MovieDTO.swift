//
//  MovieDTO.swift
//  NetworkingPrac
//
//  Created by Jehan Fernando on 2026-11-01.
//

import Foundation

struct MovieDTO: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let director: String
    let releaseDate: String
    let movieBanner: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case director
        case releaseDate = "release_date"
        case movieBanner = "movie_banner"
    }
}





/*
 ### 📖 What is a DTO?

 **DTO = Data Transfer Object.** A simple struct whose **only job is to mirror the shape of the JSON** that comes over the network.

 Why not use our own model straight away? Because **the server decides the JSON shape; we decide our app's model**. Keeping a DTO in between means:

 - If the API renames a field, only the DTO changes.
 - The DTO can contain things we don't care about; our model keeps only what the app needs.
 - Later (the mini-app task) we **convert** the DTO into a SwiftData `@Model`. The DTO is the "arrival lounge" for network data.

 ```
 JSON (server shape)  →  DTO (mirrors JSON)  →  Model (our app's shape, e.g. SwiftData)
 ```

 ### 📖 `Codable`

 `Codable` = **`Decodable` + `Encodable`**.

 | Protocol | Direction | Used for |
 | --- | --- | --- |
 | `Decodable` | JSON → Swift | Receiving data (this lecture) |
 | `Encodable` | Swift → JSON | Sending data (POST bodies) |
 | `Codable` | both | Convenient default |

 If every property of a struct is itself `Codable` (`String`, `Int`, `Double`, `Bool`, arrays, optionals, other `Codable` structs), Swift **writes the decoding code for you automatically**.

 ### 📖 `Identifiable` and `id: String`

 `List`/`ForEach` need to tell rows apart. `Identifiable` requires an `id`. The API gives every film a unique string `id`, so we use it directly — no `UUID()` needed. (`id` is a `String` here because the JSON `id` is a string.)

 ### 📖 `let` for all properties

 DTOs are **read-only snapshots** of received data, so `let` is appropriate.

 ### 📖 Matching names and types — the rules

 For automatic decoding to work:

 1. The **property name** must equal the **JSON key** (or be mapped with `CodingKeys`).
 2. The **type** must match the JSON value's type.
 3. If a key might be **missing or `null`**, make the property **optional** (`String?`).

 If a **non-optional** property's key is missing → decoding **fails** (`keyNotFound`). If the type is wrong (e.g. you declare `Int` for a quoted `"124"`) → decoding **fails** (`typeMismatch`).

 ### 📖 `CodingKeys` — renaming keys

 The JSON uses **snake_case** (`release_date`); Swift style is **camelCase** (`releaseDate`). `CodingKeys` is a nested enum that tells the decoder how to map each property to a JSON key:

 ```swift
 enum CodingKeys: String, CodingKey {
     case id                                  // same name → no text needed
     case title
     case description
     case director
     case releaseDate = "release_date"        // property releaseDate ⟷ JSON "release_date"
     case movieBanner = "movie_banner"
 }
 ```

 - `: String, CodingKey` → a String-backed enum conforming to `CodingKey`.
 - A case with **no `=`** uses its own name as the key.
 - A case **with `= "..."`** uses that text as the JSON key.
 - **Every property you want decoded must have a case**, and properties **without** a case can't be decoded (they'd need a default value).

 ### 📖 Alternative: automatic snake_case conversion

 Instead of writing `CodingKeys` for every renamed field you can tell the decoder to convert:

 ```swift
 let decoder = JSONDecoder()
 decoder.keyDecodingStrategy = .convertFromSnakeCase
 ```

 Then `release_date` automatically maps to `releaseDate`, `movie_banner` to `movieBanner`. (The lecture used explicit `CodingKeys`, which also works for **any** rename, not just snake_case.)

 ### 📖 `movieBanner: String?` — optional

 The banner might be missing or `null` for some films. `String?` allows that. Declared but **not used on screen** in the lecture — it's ready for an image later.
 */

