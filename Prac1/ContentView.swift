//
//  ContentView.swift
//  Prac1
//
//  Created by Jehan Fernando on 2026-09-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
               .foregroundColor(.red)
               .frame(width: 200, height: 100)
           
            Rectangle()
               .foregroundColor(.blue)
               .frame(width: 150, height: 80)
           
            Rectangle()
               .foregroundColor(.green)
               .frame(width: 250, height: 120)
                
        }
    }
}

#Preview {
    ContentView()
}



