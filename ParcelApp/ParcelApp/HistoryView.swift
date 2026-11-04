//
//  HistoryView.swift
//  ParcelApp
//
//  Created by Jehan Fernando on 2026-11-04.
//

import SwiftUI



struct HistoryView: View {
    @State private var selectedCategory: Category = .all
    
    private let parcels: [ParcelModel] = ParcelModel.sampleData
    
    private var filteredParcels: [ParcelModel] {
        if selectedCategory == .all {
            return parcels
        } else {
            
            return parcels.filter { $0.category == selectedCategory }
            
            
//            var temp: [ParcelModel] = []
//            
//            parcels.ForEach { item in
//                if item.category == selectedCategory {
//                    filteredParcels.append(item)
//                }
//            }
//            return filteredParcels
            
        }
    }

    
    var body: some View {
        NavigationStack {
            
            VStack {
                Picker("Category", selection: $selectedCategory) {
                    Text("All").tag(Category.all)
                    Text("Personal").tag(Category.personal)
                    Text("Business").tag(Category.business)
                }
                .pickerStyle(.segmented)
                
                List {
                    ForEach(filteredParcels) { parcel in
                        ReusableHistoryCell(model: parcel)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Parcels History")
            .padding(.horizontal)
        }
    }
}

#Preview {
    HistoryView()
}
