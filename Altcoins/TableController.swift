//
//  TableController.swift
//  Altcoins
//
//  Created by Mac Mini on 4/28/17.
//  Copyright © 2017 Armonia. All rights reserved.
//

import UIKit
import Foundation

class TableController: NSObject, UITableViewDelegate, UITableViewDataSource {
    var ticker  = Ticker()
    var options = Options()
    
    func refresh() {
        // TODO: present and reorder coins according to options
        // Copy N coins from ticker to temp by options.coins
        // order by options.order
        // present value by options.index or options.trend
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticker.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableViewCell
        //print("Item: ", indexPath.item)
        //print("Row: ", indexPath.row)
        let coin = ticker.coins[indexPath.row]
        
        cell.textSymbol.text = coin.symbol
        cell.textName.text   = coin.name
        cell.textIndex.text  = coin.priceUsd.format(10,4)
        
        return cell
    }
}
