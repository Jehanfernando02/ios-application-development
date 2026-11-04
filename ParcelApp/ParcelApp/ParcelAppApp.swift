//
//  ParcelAppApp.swift
//  ParcelApp
//
//  Created by Jehan Fernando on 2026-11-04.
//


import SwiftUI

@main
struct ParcelAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                CalculationView()
                    .tabItem {
                        Label("Calculate", systemImage: "shippingbox")
                    }

                HistoryView()
                    .tabItem {
                        Label("History", systemImage: "calendar")
                    }
            }
        }
    }
}
