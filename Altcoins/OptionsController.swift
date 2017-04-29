//
//  OptionsController.swift
//  Altcoins
//
//  Created by Mac Mini on 4/28/17.
//  Copyright © 2017 Armonia. All rights reserved.
//

import UIKit

class OptionsController: UIViewController {

    var options = Options()
    var returnAction: ((Options) -> Void) = { options in return }  // This function will be assigned on caller and called from here on return

    
    @IBAction func onOptionCoins(_ sender: UISegmentedControl) {
        print("Coin: ", sender.selectedSegmentIndex)
        self.options.coins = sender.selectedSegmentIndex
    }
    
    @IBAction func onOptionIndex(_ sender: UISegmentedControl) {
        print("Index: ", sender.selectedSegmentIndex)
        self.options.index = sender.selectedSegmentIndex
    }
    
    @IBAction func onOptionTrend(_ sender: UISegmentedControl) {
        print("Trend: ", sender.selectedSegmentIndex)
        self.options.trend = sender.selectedSegmentIndex
    }
    
    @IBAction func onOptionOrder(_ sender: UISegmentedControl) {
        print("Order: ", sender.selectedSegmentIndex)
        self.options.order = sender.selectedSegmentIndex
    }
    
    @IBAction func onCancel(_ sender: AnyObject) {
        print("Cancel")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onOK(_ sender: AnyObject) {
        print("OK")
        // Gather all options and return
        self.returnAction(self.options)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
