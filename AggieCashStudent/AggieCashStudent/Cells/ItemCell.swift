//
//  ItemCell.swift
//  AggieCashStudent
//
//  Created by Evelyn on 2/6/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(text: String){
        self.textLabel.text = text
    }
}
