//
//  SettingsView.swift
//  FocusTasks
//
//  Created by Jehan Fernando on 2026-10-07.
//

import SwiftUI

struct SettingsView: View {

    @Environment(TasksViewModel.self) private var viewModel

    var body: some View {
        Form {
            Section {
                LabeledContent("Total", value: "\(viewModel.tasks.count)")
                LabeledContent("Completed", value: "\(viewModel.completedItemsCount())")
            }
        }
    }
}

#Preview {
    SettingsView()
        .environment(TasksViewModel())
}
