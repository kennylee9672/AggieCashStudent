//
//  FoodOrder.swift
//  AggieCashStudent
//
//  Created by Davy Chuon on 1/30/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//
import Foundation

class FoodTruck {
    var foodTruckName: String
    
    init() {
        self.foodTruckName = ""
    }

    class FoodOrder {
        var itemNameQty: [String:Int]
        var itemPrice: [Double]
        var totalPrice: Double
        var orderNumber: Int
        // consider pickupTime format, Int (minutes) or String (time)
        var pickupTime: Int
        
        
        init() {
            //               self.foodTruck = ""
            self.itemNameQty = ["":0]
            self.itemPrice = []
            self.totalPrice = 0.0
            self.orderNumber = 0
            self.pickupTime = 0
        }
    }
    
}
