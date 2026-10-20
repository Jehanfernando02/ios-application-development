//
//  SettingsSheetView.swift
//  MovieGenre
//
//  Created by Jehan Fernando on 2026-10-14.
//

import SwiftUI

struct SettingsSheetView: View {

    @Environment(UserPreferences.self) private var preferences
    @Environment(\.dismiss) private var dismiss

    // Local draft for the display name; appearance changes are applied immediately.
    @State private var draftName = ""

    var body: some View {
        @Bindable var prefs = preferences   // enables $prefs.colorSchemePreference

        NavigationStack {
            Form {
                Section("Profile") {
                    TextField("Display name", text: $draftName)
                }
                Section("Appearance") {
                    Picker("Theme", selection: $prefs.colorSchemePreference) {
                        ForEach(UserPreferences.ColorSchemePreference.allCases,
                                id: \.self) { mode in
                            Label(mode.rawValue, systemImage: mode.icon).tag(mode)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear { draftName = preferences.displayName }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        preferences.displayName = draftName
                        dismiss()
                    }.fontWeight(.semibold)
                }
            }
        }
    }
}


#Preview("Settings") {
    SettingsSheetView()
        .environment(UserPreferences())
}
