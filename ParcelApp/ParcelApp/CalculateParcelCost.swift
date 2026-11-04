//
//  CalculateParcelCost.swift
//  ParcelApp
//
//  Created by Jehan Fernando on 2026-11-04.
//



import Foundation

struct CalculateParcelCost {

    func calculateVolume(length: Double, width: Double, height: Double) -> Double {
        return length * width * height
    }

    func calculatePersonalCost(weight: Double, volume: Double) -> Double {
        let cost = 3.00
            + (weight * 0.50)
            + ((volume / 1000) * 0.10)

        return max(cost, 4.00)
    }

    func calculateBusinessCost(weight: Double, volume: Double, insurance: Double) -> Double {
        let cost = 5.00
            + (weight * 1.50)
            + ((volume / 1000) * 0.75)
            + insurance

        return cost
    }
}
