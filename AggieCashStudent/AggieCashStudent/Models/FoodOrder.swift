//
//  FoodOrder.swift
//  AggieCashStudent
//
//  Created by Davy Chuon on 1/30/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//
import Foundation

class FoodOrder {
    var foodTruck: String
    var itemName: [String]
    var orderNumber: Int
    var itemPrice: [Int]
    var totalPrice: Double
    // consider pickupTime format, Int (minutes) or String (time)
    var pickupTime: Int
 

    init() {
        self.foodTruck = ""
        self.itemName = []
        self.orderNumber = 0
        self.itemPrice = []
        self.totalPrice = 0.0
        self.pickupTime = 0
    }
//
//    init(name: String) {
//        self.fullName = name
//        self.totalSpent = 0.0
//        self.giftsPurchased = [Gifts]()
//        self.totalGifts = 0
//    }
//    class Gifts {
//        var giftName: String
//        var giftPrice: Double
//
//        init() {
//            self.giftName = ""
//            self.giftPrice = 0.0
//        }
//
//        init(gift: String, price: Double) {
//            self.giftName = gift
//            self.giftPrice = price
//        }
//    }

}
