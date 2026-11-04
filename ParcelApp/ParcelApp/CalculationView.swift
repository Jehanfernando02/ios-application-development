//
//  CalculationView.swift
//  ParcelApp
//
//  Created by Jehan Fernando on 2026-11-04.
//

import SwiftUI

struct CalculationView: View {
    
    @State private var isInsured: Bool = false
    @State private var insuaranceValue = 0.0
    
    @State private var weight: Double?
    @State private var length: Double?
    @State private var width: Double?
    @State private var height: Double?
    
    @State private var result: Double?
    
    @State private var showInvalidInput = false
    @State private var alertMessage = ""
    
    private let calculator = CalculateParcelCost()
    
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
                
                Section("Dimensions & Weight") {
                    
                    ReusableTextFieldView(label: "Weight (Kg)", value: $weight)
                    
                    ReusableTextFieldView(label: "Length (cm)", value: $length)
                    
                    ReusableTextFieldView(label: "Width (cm)", value: $width)
                    
                    ReusableTextFieldView(label: "Height (cm)", value: $height)
                    
                }
                
                Section {
                    Button {
                        calculateCost()
                    } label: {
                        Text("Calculate Cost")
                    }
                    .frame(maxWidth: .infinity)
                }
                
                if let unwrappedResult = result {
                    Section ("Results") {
                        HStack {
                            Text("Total Cost")
                            
                            Spacer()
                            
                            // 3 ways
                            /*
                             if let
                             guard let
                             force unwrap (!)
                             */
                            
                            
                            Text(String(format : "%.2f", unwrappedResult))
                        }
                    }
                }
                
                
            }
            .navigationTitle("Parcel Cost")
            .alert("Invalid Input", isPresented: $showInvalidInput) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    
    func calculateCost() {

        // 1. Validate inputs
        guard let weight,
              let length,
              let width,
              let height,
              weight > 0,
              length > 0,
              width > 0,
              height > 0,
              (!isInsured || (weight <= 30 &&
                              length <= 150 &&
                              width <= 150 &&
                              height <= 150))
        else {
            result = nil

            alertMessage = """
            Please ensure all dimensions and weights are greater than 0.
            For insured parcels, maximum weight is 30kg and maximum dimension is 150cm.
            """

            showInvalidInput = true
            return
        }

        // 2. Calculate volume
        let volume = calculator.calculateVolume(
            length: length,
            width: width,
            height: height
        )

        // 3. Calculate cost
        if isInsured {
            result = calculator.calculateBusinessCost(
                weight: weight,
                volume: volume,
                insurance: insuaranceValue
            )
        } else {
            result = calculator.calculatePersonalCost(
                weight: weight,
                volume: volume
            )
        }
    }


    
}

#Preview {
    CalculationView()
}
