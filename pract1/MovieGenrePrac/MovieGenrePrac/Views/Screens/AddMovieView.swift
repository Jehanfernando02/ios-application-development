//
//  AddMovieView.swift
//  MovieGenrePrac
//
//  Created by Jehan Fernando on 2026-10-27.
//

import SwiftUI

struct AddMovieView: View {
    
    // Parent supplies this closure; result travels back via callback
    var onSave: (Movie) -> Void
    
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = AddMovieViewModel()
    
    var body: some View {
        @Bindable var vm = viewModel   // enables $vm.title etc.
        
        NavigationStack {
            Form {
                Section("Basic Information") {
                    TextField("Movie Title", text: $vm.title)
                        .textInputAutocapitalization(.words)
                    
                    Picker("Genre", selection: $vm.selectedGenre) {
                        ForEach(Genre.allCases, id: \.self) { genre in
                            Label(genre.rawValue, systemImage: genre.icon).tag(genre)
                        }
                    }
                }
                
                Section("Details") {
                    Stepper("Year: \(viewModel.year)", value: $vm.year,
                            in: 1900...2100)
                    
                    VStack (alignment: .leading) {
                        HStack {
                            Text("Rating")
                            Spacer()
                            RatingView(rating: viewModel.rating)
                        }
                        
                        Slider(value: $vm.rating, in: 0...10, step: 0.1).tint(.yellow)
                    }
                    
                    Stepper("Duration: \(viewModel.duration) min", value: $vm.duration, in: 1...500)
                    
                }
                
                Section("Synopsis"){
                    TextEditor(text: $vm.synopsis).frame(minHeight: 100)
                }
            }
            .navigationTitle("New Movie")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel") { dismiss() }.foregroundColor(.red)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        onSave(viewModel.buildMovie())
                        dismiss()
                    }
                    .fontWeight(.bold)
                    .disabled(!viewModel.isFormValid) // guarded Save
                }
            }
        }
    }
}

#Preview {
    AddMovieView { movie in
        print("Preview Saved: \(movie.title)")
    }
}


/*
 ### 📖 Theory: how does `@Bindable` enable `$vm.title`?

 The ViewModel is stored with `@State`, but the form controls need **bindings** to its properties.

 ```swift
 @Bindable var vm = viewModel
 ```

 This local declaration exposes binding access to the existing observable object. It doesn't create a new object.

 Then:

 ```swift
 TextField("Movie Title", text: $vm.title)
 ```

 uses `$vm.title` as a two-way connection between the text field and the ViewModel property.

 Without the binding, the text field wouldn't have the required mechanism to write changes back to the model.
 */
