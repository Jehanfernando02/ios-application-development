//
//  MovieListViewModel.swift
//  MovieGenrePrac
//
//  Created by Jehan Fernando on 2026-10-20.
//

import Foundation
import Observation


/*
`@Observable` comes from the **Observation** framework. It makes the object's stored properties trackable so SwiftUI can update views when relevant state changes. It is the modern observation approach used, rather than the older `ObservableObject` and `@Published` pattern. `final` prevents the class from being subclassed. This is appropriate for these small ViewModels because the tutorial doesn't need subclasses.
 */

// movies.firstIndex(where: { $0.id == movie.id })
/*
 - `firstIndex` searches an array and returns the index of the first matching element.
 - `{ ... }` is a ** closure ** — a block of code passed to a function.
 - `$0` is shorthand for the closure's first argument.
 - `$0.id == movie.id` checks whether the current array movie has the same ID as the movie passed to the method.
 */


@Observable
final class MovieListViewModel {
    
    var movies: [Movie] = MockDataStore.movies
    
    var searchText: String = ""
    
    var filteredMovies: [Movie] {
        filter(movies: movies)
    }
    
    func filter(movies: [Movie]) -> [Movie] {
        guard !searchText.isEmpty else {
                  return movies
              }
        return movies.filter {
                    $0.title.localizedCaseInsensitiveContains(searchText)
                }
    }
    
    func watchMarked (movie: Movie) {
        if let index = movies.firstIndex(
            where: { $0.id == movie.id}
        ) {
            movies[index].isWatched = true
        }
    }
    
    // (Movie) -> Void
    func markWatched(_ movie: Movie) {
        if let index = movies.firstIndex(where: { $0.id == movie.id }) {
            movies[index].isWatched = true
        }
    }
    
    func addMovie(movie: Movie) {
        movies.append(movie)
    }
    
    func deleteMovies(at offsets: IndexSet) {
        let filtered = filteredMovies
        for i in offsets {
            movies.removeAll { $0.id == filtered[i].id }
        }
    }
}



/*
 `MockDataStore` provides the **initial** values. `MovieListViewModel` owns the app's **current in-memory list**, including changes made by the user.

 That distinction matters. If the user marks a movie as watched, the ViewModel's array changes. The static sample array is not the active state container for the screen.
 */


/*
 ### Theory: why use `@Observable` instead of `ObservableObject`?

Here it uses modern Observation:

 import Observation

 @Observable
 class MovieListViewModel { ... }
 ```

 With this approach, SwiftUI tracks observable properties that a view reads. You do not need to mark each property with `@Published`.

 In the screen, `@State` will own the ViewModel instance. Together, `@Observable` and `@State` give SwiftUI the state ownership and observation behaviour this tutorial needs.
 */

/*
### 📖 Theory: why is `filter` in the ViewModel?

Filtering is a **data operation**, not a drawing operation.

The search field should only update `searchText`. The ViewModel decides which movies match. This keeps the View simple and means the same filtering logic could be reused by another screen or tested independently.

### 📖 Understand `localizedCaseInsensitiveContains`

```swift
$0.title.localizedCaseInsensitiveContains(searchText)
```

The method returns a Boolean. It checks whether the title contains the search string without treating case differences as meaningful. This is more suitable for a user-facing search field than a strict, case-sensitive comparison.

### 📖 Understand deletion carefully

```swift
let filtered = filteredMovies

for i in offsets {
    movies.removeAll { $0.id == filtered[i].id }
}
```

`IndexSet` contains the indices the user requested to delete from the **displayed** list.

The code first saves the current filtered list. For every selected visible index, it finds the corresponding movie's ID and removes that movie from the original `movies` array.

This is essential because a visible row's index in search results may not match its index in the original list.

> **Example:** searching for "Arrival" could produce one result at visible index `0`, even though Arrival is the ninth movie in the original array. Deleting the visible index directly from the original array could remove the wrong movie. Matching by ID avoids that.
>

The tutorial assumes the offsets refer to valid indices in the `filteredMovies` snapshot. This is the normal SwiftUI swipe-to-delete flow.

*/
