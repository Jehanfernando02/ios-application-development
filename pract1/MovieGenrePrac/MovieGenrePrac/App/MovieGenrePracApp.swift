//
//  MovieGenrePracApp.swift
//  MovieGenrePrac
//
//  Created by Jehan Fernando on 2026-10-19.
//

import SwiftUI

@main
struct MovieGenreFilterApp: App {

    @State private var preferences = UserPreferences()

    var body: some Scene {
        WindowGroup {
            MovieListView()
                .environment(preferences)
                .preferredColorScheme(preferences.preferredColorScheme)
        }
    }
}


/*
 ### 📖 Theory: how does `.environment(preferences)` work?

 The app creates **one** `UserPreferences` instance and provides it to the view hierarchy.

 Later, `MovieListView` and `SettingsSheetView` can retrieve that instance with:

 ```swift
 @Environment(UserPreferences.self) private var preferences
 ```

 They don't create a second object. They retrieve the shared object the app injected.

 This is **dependency injection**: a view receives access to a dependency supplied from outside it, rather than constructing its own separate instance.

 > **Why is that useful?** If the settings screen created its own preferences object, changing its theme wouldn't necessarily change the object used by the app entry point. Injecting one shared instance keeps the app consistent.
 >

 ### 📖 Theory: why `@State` in the App?

 ```swift
 @State private var preferences = UserPreferences()
 ```

 The app owns the shared object's lifetime. `@State` keeps the reference stable across SwiftUI updates. `@Observable` makes changes to the object's properties trackable.

 Those two features work together, but they have different responsibilities.
 */
