import SwiftUI
import Observation






//This declares a SwiftUI view. The View protocol requires a body property that describes what the interface should look like.
/*
 some View means the property returns a value conforming to View, while allowing the compiler to infer its concrete type. A SwiftUI view can combine many nested views into a single expression.
 */

//private keyword limits access to the property to its enclosing type
//    - `NavigationStack` manages a navigation hierarchy.
//    - `List` creates a scrollable list of rows.
//    - `NavigationLink` lets a user select a row and navigate to another view.
//    - `.navigationTitle(...)` sets the navigation bar title.
//    - `.listStyle(.plain)` changes the list's visual style.
//    Here, `NavigationLink` displays a simple placeholder detail screen. The full tutorial will replace it with `MovieDetailView`.


struct ContentView : View {
    
    @State private var viewModel = MovieListViewModel()
    
    // For each movie, the closure receives that movie and creates a row.

    var body : some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                NavigationLink {
                    Text(movie.title)
                        .navigationTitle(movie.title)
                } label: {
                    MovieRowView(movie: movie)
                }
            }
            .listStyle(.plain)
            .navigationTitle("My Movie List")
        }
    }
}
    

#Preview {
    ContentView()
}

