//
//  UserPreferences.swift
//  MovieGenre
//
//  Created by Jehan Fernando on 2026-10-14.
//

import SwiftUI
import Observation

@Observable
final class UserPreferences {

    // Appearance selection held in app state (not persisted to disk in Part 2)
    var colorSchemePreference: ColorSchemePreference = .system
    var displayName: String = "My"

    // Converts the enum to the optional ColorScheme SwiftUI expects
    var preferredColorScheme: ColorScheme? {
        switch colorSchemePreference {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return nil
        }
    }

    enum ColorSchemePreference: String, CaseIterable {
        case light  = "Light"
        case dark   = "Dark"
        case system = "System"

        var icon: String {
            switch self {
            case .light:  return "sun.max"
            case .dark:   return "moon.stars"
            case .system: return "circle.lefthalf.filled"
            }
        }
    }
}
