//
//  MenuTableViewCell.swift
//  AggieCashStudent
//
//  Created by Adila on 2/13/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    func setItem(item: Item) {
        self.nameLable.text = item.name
        self.priceLable.text = String(item.price)
        self.descriptionLable.text = item.description
        self.setUI()
    }
    
    func setUI() {
        
    }
}
