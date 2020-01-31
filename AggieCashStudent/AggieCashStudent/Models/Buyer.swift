//
//  Buyer.swift
//  AggieCashStudent
//
//  Created by Davy Chuon on 1/30/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//
import Foundation

class Buyer {
    var name: String
    var email: String
    
    init() {
        self.name = ""
        self.email = ""
    }
    
    class orderHistory {
        var foodTruckName: [String]
        // restructure..
        // item name & price
        var pastOrders: [String:Double]
        
        init() {
            self.foodTruckName = [""]
            self.pastOrders = ["":0.0]
        }
    }

}
