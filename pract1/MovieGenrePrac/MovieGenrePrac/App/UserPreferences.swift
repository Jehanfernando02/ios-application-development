//
//  UserPreferences.swift
//  MovieGenrePrac
//
//  Created by Jehan Fernando on 2026-10-26.
//

import SwiftUI
import Observation

@Observable
final class UserPreferences {

    var colorSchemePreference: ColorSchemePreference = .system
    var displayName: String = "My"

    var preferredColorScheme: ColorScheme? {
        switch colorSchemePreference {
        case .light:  return .light
        case .dark:   return .dark
        case .system: return nil
        }
    }

    enum ColorSchemePreference: String, CaseIterable {
        case light = "Light"
        case dark = "Dark"
        case system = "System"

        var icon: String {
            switch self {
            case .light: return "sun.max"
            case .dark: return "moon.stars"
            case .system: return "circle.lefthalf.filled"
            }
        }
    }
}

/*
 ### 📖 Theory: nested enums

 Unlike `Genre`, the `ColorSchemePreference` enum is **nested** inside `UserPreferences`.

 That means the full type name is:

 ```swift
 UserPreferences.ColorSchemePreference
 ```

 The tutorial nests it because the available appearance options are specifically part of the preferences feature. `Genre`, by contrast, is a movie-domain type used throughout the app, so it remains top-level.

 ### 📖 Theory: shared app state

 `UserPreferences` stores two values used by multiple screens:

 - `colorSchemePreference` determines the appearance.
 - `displayName` determines the navigation title.

 Keeping them in one observable object allows all interested views to read the same state instead of keeping separate, inconsistent copies.

 > Remember: this is still **in-memory** state, not persistent storage.
 >
 */
