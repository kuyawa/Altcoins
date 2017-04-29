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
    
    @IBAction func onOptionsMenu(_ sender: UIButton) {
        print("Show options")
        let optionsController = OptionsController()
        optionsController.options = state.options
        optionsController.returnAction = returnAction
        self.present(optionsController, animated: true, completion: nil)
    }
    
    func returnAction(options: Options) {
        print("Options selected: ", options)
        state.options = options

        //saveoptions
        showTicker()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
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
        textAltex.text = "ALTEX INDEX \(altex)"
    }
    
    func showUpdated() {
        textUpdated.text = "UPDATED ON \(state.updated.short())"
    }

}

