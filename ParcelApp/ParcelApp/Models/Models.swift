//
//  Models.swift
//  ParcelApp
//
//  Created by Jehan Fernando on 2026-11-04.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    case all, personal, business
    
    var id: Self { self }
}

struct ParcelModel: Identifiable {
    let id: UUID = UUID()
    let category: Category
    let date: Date
    let weight: Double
    let volume: Double
    let insuarance: Double
    let cost: Double
}

extension ParcelModel {
    static let sampleData: [ParcelModel] = [
           ParcelModel(category: .business, date: Date(), weight: 10, volume: 1.5, insuarance: 100, cost: 25.50),
           ParcelModel(category: .personal, date: Date(), weight: 2.5, volume: 0.8, insuarance: 0, cost: 10.00),
           ParcelModel(category: .business, date: Date(), weight: 15, volume: 3.2, insuarance: 200, cost: 45.00),
           ParcelModel(category: .personal, date: Date(), weight: 5, volume: 2.0, insuarance: 0, cost: 15.50),
           ParcelModel(category: .business, date: Date(), weight: 8, volume: 1.2, insuarance: 150, cost: 30.00),
           ParcelModel(category: .personal, date: Date(), weight: 1.5, volume: 0.5, insuarance: 0, cost: 8.00),
           ParcelModel(category: .business, date: Date(), weight: 20, volume: 4.5, insuarance: 300, cost: 60.00),
           ParcelModel(category: .personal, date: Date(), weight: 7, volume: 2.5, insuarance: 0, cost: 20.00),
           ParcelModel(category: .business, date: Date(), weight: 12, volume: 2.8, insuarance: 250, cost: 40.00),
           ParcelModel(category: .personal, date: Date(), weight: 3, volume: 1.0, insuarance: 0, cost: 12.50)
       ]
}
