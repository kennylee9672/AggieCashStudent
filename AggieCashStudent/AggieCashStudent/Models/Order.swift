//
//  Order.swift
//  AggieCashStudent
//
//  Created by Kenny Li on 1/30/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import Foundation

class Item {
    var name = ""
    var price = 0.0
    
    init() {
        self.name = "Item Name"
        self.price = 0.0
    }
}

class Order {
    var seller: Seller
    var buyer: Buyer
    var item: [Item]
    
    init() {
        self.seller = Seller()
        self.buyer = Buyer()
        self.item = []
    }
    
//    // Parsing
//    init(data:[String: Any]) {
//        if let seller  = data["seller"]
//
//
//        self.seller = data["seller"]
//        self.buyer = data["buyer"]
//        self.item = data["item"]
//    }
//
//    init(by seller: Seller, to buyer: Buyer, with items: [Item]) {
//        self.seller = seller
//        self.buyer = buyer
//        self.item = items
//    }
//
//    func printOrder() {
//        print("=======================")
//        //print("uid: \(self.uid)")
//        print("seller: \(self.seller)")
//        print("buyer: \(self.buyer)")
//        print("item: \(self.item)")
//        print("=======================")
//    }
}
