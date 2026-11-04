//
//  ContentView.swift
//  ParcelApp
//
//  Created by Jehan Fernando on 2026-11-04.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isInsured: Bool = false
    @State private var insuaranceValue = 0.0
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Parcel Setup") {
                    Toggle(isOn: $isInsured) {
                        if isInsured {
                            Label("Business (Insured)", systemImage: "suitcase")
                                .foregroundStyle(.purple)
                                .fontWeight(.bold)
                            
                            
                        } else {
                            Label("Personal (Uninsured)", systemImage: "person")
                                .foregroundStyle(.blue)
                                .fontWeight(.bold)
                            
                        }
                        
                    }
                    
                    if isInsured {
                        VStack {
                            HStack {
                                Text("Insuarance Cover")
                                
                                Spacer()
                                
                                Text(String(format : "%.2f", insuaranceValue))
                                
                            }
                            Slider(value: $insuaranceValue, in: 0...100, step: 5)
                        }
                    }
                }
            }
            .navigationTitle("Parcel Cost")
        }
    }
}

#Preview {
    ContentView()
}
