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
        HStack(spacing:20){
            Button("Increment"){
                count = count + 1
            }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
            
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






//import SwiftUI

//

//struct ContentView: View {

//

////    @State var count: Int = 0

////    @State var userInput: String = ""

//    @State var count: Int = 0

//

////    var body: some View {

////

////        TextField("placeholder", text: $userInput)

////

////        Button("Click") {

////            print(userInput)

////        }

////

////    }

//

//    var body: some View{

//        VStack {

//            Text("\(count)")

//

//            CustomButton(countValue: $count)

//        }

//    }

//

//

//

//}

//

//struct CustomButton: View {

//    @Binding var countValue: Int

//

//    var body: some View {

//        Button("Click Me") {

//            countValue = countValue + 1

//

//        }

//    }

//}

//

//#Preview {

//    ContentView()

//}

//

//

//ScrollView(.vertical){

//    VStack(spacing:20){

//        Text("Hello, World!")

//            .font(.title)

//            .bold()

//

//        Text("------- hi ---------")

//            .font(.title)

//            .bold()

//

//        HStack(spacing:30){

//            Button{

//                count =  count + 1

//            } label: {

//                Text("Increment")

//                    .font(.default)

//                    .bold()

//                    .foregroundStyle(.white)

//                    .padding()

//                    .background(.black)

//                    .cornerRadius(16)

//            }

//

//            Text("\(count)")

//                .padding()

//                .bold()

//                .font(.title)

//

//            Button{

//                count = count - 1

//

//

//            } label: {

//                Text("Decrement")

//                    .font(.default)

//                    .bold()

//                    .foregroundStyle(.white)

//                    .padding()

//                    .background(.black)

//                    .cornerRadius(16)

//

//            }

//        }

//    }

//}
