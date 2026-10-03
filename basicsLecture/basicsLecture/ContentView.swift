//
//  ContentView.swift
//  basicsLecture
//
//  Created by Jehan Fernando on 2026-09-30.
//

import SwiftUI

//protocol MyProtocol {
//    
//}
//
//class CParent: MyProtocol {
//    
//}
//
//class SParent: MyProtocol {
//    
//}
//
//
//


enum MuscleGroup: CaseIterable {
    case chest
    case legs
    case back
    case shoulders
    case arms
}

extension MuscleGroup {
    // Computed property
    var displayName: String {
        switch self {
        case .chest:
            return "chest group"
        case .legs:
            return "legs group"
        case .back:
            return "back group"
        case .shoulders:
            return "shoulders group"
        case .arms:
            return "arms group"
        }
    }
    
}

struct Workout {
    // Stored property
    let name: String
    let muscleGroup: MuscleGroup
    let duration: Int
    
    // lazy property
//    lazy var iit: String = {
//        // some complex logic
//        return "iit"
//    }()
    
}

func isLongWorkout(workout: Workout) -> Bool {
    workout.duration >= 50
}

struct ContentView: View {
    let workouts = [
        Workout(name: "Bench Press", muscleGroup: .chest, duration: 45),
        Workout(name: "Incline Bench Press", muscleGroup: .chest, duration: 45),
        Workout(name: "Squats", muscleGroup: .legs, duration: 60),
        Workout(name: "PullUps", muscleGroup: .back, duration: 30)
    ]
    
    @ViewBuilder
    var greeting1: some View {

        //            ForEach(MuscleGroup.allCases, id: \.self) { group in
        //
        //                Text("\(group.displayName)")
        //
        //            }
        //
        //            Divider()

        Section {

            ForEach(workouts, id: \.name) { workout in

                VStack(alignment: .leading) {

                    Text(workout.name)

                    Text("\(workout.muscleGroup)")

                    Text("\(workout.duration)")

                }

            }

        }

    }

    @ViewBuilder
    var greeting2: some View {

        Section {

            // let filteredItems = workouts.filter(isLongWorkout)

            // let filteredItems = workouts.filter { workout in
            //    workout.duration >= 50
            //   }

            let filteredItems = workouts.filter {

                $0.duration >= 50

            }

            ForEach(filteredItems, id: \.name) { workout in

                VStack(alignment: .leading) {

                    Text(workout.name)

                    Text("\(workout.muscleGroup)")

                    Text("\(workout.duration)")

                }

            }

        }

    }

    var body: some View {

        List {

            greeting1

            greeting2

        }

    }

}
        
#Preview {
    ContentView()
}

        
    

let intArray = [1,2,3,4,5]
let stringArr ["a","b","c","d","e"]


//func returnFirstValue<T>(array: [T]) -> T {
//    return array[0]
//}


func returnFirstValue<T>(externalParamName x: [T]) -> T {
    return x[0]
}

returnFirstValue(externalParamName: intArray)

//returnFirstValue(array: intArray)
//returnFirstValue(array: stringArr)

//func returnFirstIntValue(array: [Int]) -> Int {
//    return array[0]
//}
//
//func returnFirstStringValue(array: [String]) -> String {
//    return array[0]
//}





