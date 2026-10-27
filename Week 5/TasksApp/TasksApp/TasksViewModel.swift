//
//  TaskViewModel.swift
//  TasksApp
//
//  Created by Jehan Fernando on 2026-10-21.
//

import SwiftUI
import Observation

@Observable
final class TaskViewModel {
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
}
