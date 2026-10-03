//
//  Observable.swift
//  basicsLecture
//
//  Created by Jehan Fernando on 2026-10-03.
//


/*
 import Observation    Imports the Observation framework so you can use its features
 @Observable    Marks a class so its property changes can be observed
 Observable object    An object whose changes can be detected by SwiftUI
 */

import SwiftUI
import Observation


// @Observable tells SwiftUI to observe this class.
// When a property used by the View changes, SwiftUI knows about the change
// and automatically updates the View with the new value.
@Observable
class ViewModel {

    var count: Int = 0
    var count2: Int = 0

    // Increase the count
    func increment() {
        count += 1
    }

    // Decrease the count
    func decrement() {
        count -= 1
    }
}


struct ContentView2: View {

    @State private var viewModel = ViewModel()

    var body: some View {

        VStack(spacing: 20) {

            Text("Count: \(viewModel.count)")

            Button("Increment") {
                viewModel.increment()
            }

            Button("Decrement") {
                viewModel.decrement()
            }
        }
        .padding()
    }
}



#Preview {
    ContentView2()
}
