//
//  ViewController.swift
//  Altcoins
//
//  Created by Mac Mini on 4/27/17.
//  Copyright © 2017 Armonia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var config = Config()
    var state  = State()

    var tableController = TableController()

    @IBOutlet weak var textAltex   : UILabel!
    @IBOutlet weak var textUpdated : UILabel!
    @IBOutlet weak var tableView   : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.backgroundColor = UIColor.black
        tableView.register(nib, forCellReuseIdentifier: "tableCell")
        tableView.delegate   = tableController
        tableView.dataSource = tableController
        start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // RUN
    
    func start() {
        print("Hello")
        config.load()
        state.start(onReady: showTicker)
    }
    
    func showTicker() {
        tableController.ticker  = state.ticker
        tableController.options = state.options
        tableController.refresh()
        tableView.reloadData()
        calcAltexIndex()
        showUpdated()
    }
    
    func calcAltexIndex() {
        let altex = state.ticker.altex100()
        textAltex.text = "ALTEX \(altex)"
    }
    
    func showUpdated() {
        textUpdated.text = "UPDATED ON \(state.updated.short())"
    }

}

