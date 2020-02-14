//
//  Order.swift
//  AggieCashStudent
//
//  Created by Kenny Li on 1/30/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import Foundation

class Order {
    var items: [String]
    var buyer: String 
    var seller: String
    var time: String
    
    // Default constructor
    init() {
        self.items = [] //item's ids
        self.buyer = "00000000" //buyer's id
        self.seller = "00000000" //seller's id
        self.time = "00:00"
    }
    
    // Custom constructor
    init(by seller: String, to buyer: String, with items: [String], at time: String) {
        self.items = items
        self.buyer = buyer
        self.seller = seller
        self.time = time
    }
    
    // Parsing
    init(data:[String: Any]) {
        if let res = data["items"] as? [String] {
            self.items = res
        } else {
            self.items = []
        }
        self.seller = data["seller"] as! String
        self.buyer = data["buyer"] as! String
        self.time = data["time"] as! String
    }
    
    func printOrder() {
        print("=======================")
        //print("uid: \(self.uid)")
        print("itemsID: \(self.items)")
        print("buyerID: \(self.buyer)")
        print("sellerID: \(self.seller)")
        print("at: \(self.time)")
        print("=======================")
    }
}
