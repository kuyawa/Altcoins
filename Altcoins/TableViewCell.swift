//
//  TableViewCell.swift
//  Altcoins
//
//  Created by Mac Mini on 4/28/17.
//  Copyright © 2017 Armonia. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var textSymbol : UILabel!
    @IBOutlet weak var textName   : UILabel!
    @IBOutlet weak var textIndex  : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //print("Cell awaken")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //print("Cell selected")
        // Configure the view for the selected state
    }
    
}
