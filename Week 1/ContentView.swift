//
//  ContentView.swift
//  Prac1
//
//  Created by Jehan Fernando on 2026-09-24.
//

// ---------------------------------------------------------------------

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

// ---------------------------------------------------------------------

/*
import SwiftUI

struct ContentView: View {
    
    // @State allows the value to change
       // and automatically updates the UI when it changes.
    @State var count:Int = 0
    
    var body: some View {
        HStack(spacing:20){
            
            Button {
                count = count + 1
            }
            
            label: {
                Text("Increment")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
            }
            
            Text("\(count)")
                .padding()
                .foregroundStyle(.white)
                .background(.black)
                .cornerRadius(16)
            
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

 */

// ---------------------------------------------------------------------


import SwiftUI

// @State = this View owns the value
struct ContentView: View {

    @State var count: Int = 0

    var body: some View {
        VStack {

            // Shows the current count
            Text("\(count)")

            // $count passes a binding to the child View
            CustomButton(countValue: $count)
        }
    }
}


// @Binding = this View can use and change
// a value owned by another View
struct CustomButton: View {

    @Binding var countValue: Int

    var body: some View {
        Button("Click Me") {

            // Changes the original count in ContentView
            countValue = countValue + 1
        }
            .padding()
            .background(.green)
            .foregroundStyle(.white)
            .cornerRadius(10)
    }
}


#Preview {
    ContentView()
}


//@State     → owns the value
//$count     → passes the connection
//@Binding   → receives the connection
//
//So CustomButton is changing the same count that ContentView owns.
