//
//  ContentView.swift
//  Prac1
//
//  Created by Jehan Fernando on 2026-09-24.
//

//import SwiftUI

//struct ContentView: View {
//    var body: some View {
        
        //VStack
//        VStack(spacing: 20) {
//            Rectangle()
//               .foregroundColor(.red)
//               .frame(width: 200, height: 100)
//
//            Rectangle()
//               .foregroundColor(.blue)
//               .frame(width: 150, height: 80)
//
//            Rectangle()
//               .foregroundColor(.green)
//               .frame(width: 250, height: 120)
//
//        }
        
        // Now the HStack is scrollable horizontally
//        ScrollView(.horizontal){
//            
//            // HStack
//            HStack(spacing: 30){
//                Rectangle()
//                    .foregroundColor(.blue)
//                    .frame(width: 200, height: 100)
//                Rectangle()
//                    .foregroundColor(.yellow)
//                    .frame(width: 200, height: 100)
//                Rectangle()
//                    .foregroundColor(.green)
//                    .frame(width: 200, height: 100)
//            }
//        }
        
//        ZSack is used to place views on top of each other — like layers.
//            ZStack {
//               Rectangle()
//                   .foregroundColor(.blue)
//                   .frame(width: 200, height: 200)
//
//               Rectangle()
//                   .foregroundColor(.yellow)
//                   .frame(width: 120, height: 120)
//
//               Text("Hello")
//                   .foregroundColor(.green)
//                   .bold()
//           }
        
//    }
//}

import SwiftUI

struct ContentView: View {
    
    @State var count:Int = 0
    
    var body: some View {
        HStack(spacing:30){
            Button("Increment"){
                count = count + 1
            }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
            
            Text("\(count)")
            
            Button("Decrement"){
                count = count - 1
            }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
            
        }
    }
}


#Preview {
    ContentView()
}





