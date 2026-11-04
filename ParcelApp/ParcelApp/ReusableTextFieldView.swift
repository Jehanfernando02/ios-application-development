//
//  ReusableTextFieldView.swift
//  ParcelApp
//
//  Created by Jehan Fernando on 2026-11-04.
//

import SwiftUI

struct ReusableTextFieldView : View {
    
    var label: String
    @Binding var value: Double?
    
    @State private var numberFormatter: NumberFormatter = {
        var nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }()
    
    var body: some View {
        HStack {
            
            Text(label)
                .frame(width: 100, alignment: .leading)
            
            TextField("Enter here", value: $value, formatter: numberFormatter)
                .keyboardType(.decimalPad)

        }
        
    }
}
