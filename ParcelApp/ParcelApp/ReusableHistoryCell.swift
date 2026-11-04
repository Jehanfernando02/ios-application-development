//
//  ReusableHistoryCell.swift
//  ParcelApp
//
//  Created by Jehan Fernando on 2026-11-04.
//

import SwiftUI

struct ReusableHistoryCell: View {
    let model: ParcelModel

    var body: some View {
        VStack {
            HStack {
                
                Text(model.category.rawValue.uppercased())
                    .bold()
                    .foregroundStyle(model.category == .personal ? .blue : .purple)
                Spacer()

                Text(model.date.formatted(date: .abbreviated, time: .omitted))
                    .foregroundStyle(.secondary)
            }

            HStack {
                Text("Weight: \(model.weight, specifier: "%.2f") kg")
                Spacer()
                Text("Cost: $\(model.cost, specifier: "%.2f")")
                    .bold()
            }

            HStack {
                Text("Volume: \(model.volume, specifier: "%.3f") cm^3")
                Spacer()
                Text("Insurance: $\(model.insuarance, specifier: "%.2f")")
                    .bold()
            }
        }
    }
}
