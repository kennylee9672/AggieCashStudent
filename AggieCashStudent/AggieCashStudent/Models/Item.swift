//
//  Item.swift
//  AggieCashStudent
//
//  Created by Kenny Li on 2/13/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import Foundation

class Item {
    var name = ""
    var description = ""
    var price = 0.0
    var isAvailable = true
    var sellerID: String  //seller's id
    
    // Default constructor
    init() {
        self.name = "Item Name"
        self.description = "Item Description"
        self.price = 0.0
        self.isAvailable = true
        self.sellerID = "00000000"
    }
    
    // Custom constructor
    init(name: String, description: String, price: Double, isAvalible: Bool, sellerID: String) {
        self.name = name
        self.description = description
        self.price = price
        self.isAvailable = isAvalible
        self.sellerID = sellerID
    }
    
    // Parsing
    init(data: [String: Any]) {
        self.name = data["name"] as! String
        self.description = data["description"] as! String
        self.price = data["price"] as! Double
        
        let temp = data["isAvailable"] as! String
        if temp == "TRUE" {
            self.isAvailable = true
        }else{
            self.isAvailable = false
        }
        
        self.sellerID = data["sellerID"] as! String
    }
    
    func printItem() {
        print("=======================")
        print("name: \(self.name)")
        print("description: \(self.description)")
        print("price: \(self.price)")
        print("sellerID: \(self.sellerID)")
        print("=======================")
    }
}
