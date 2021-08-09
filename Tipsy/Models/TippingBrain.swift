//
//  TippingBrain.swift
//  Tipsy
//
//  Created by Firas El Jerdy on 09/08/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

struct TippingBrain {

    private var totalResult: Float?
    private var amountPeople: Float?
    private var tip: Float?
    
    mutating func calculateTotalBill(bill: Float, amountPeople: Float, tip: Float) {
        totalResult = (bill + (bill * (tip / bill))) / amountPeople
        self.amountPeople = amountPeople
        self.tip = tip
    }
    
    func getTotalResult() -> Float {
        return totalResult ?? 0.0
    }
    
    func getDescription() -> String {
        let des = "Split between \(String(format: "%.0f", amountPeople ?? 1.0)) people, with \(String(format: "%.0f", tip ?? 0.0))% tip."
        return des
    }
    
    func getAmountPeople() -> Float {
        return amountPeople ?? 2.0
    }
}
