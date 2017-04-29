//
//  State.swift
//  Altcoins
//
//  Created by Mac Mini on 4/27/17.
//  Copyright © 2017 Armonia. All rights reserved.
//

import Foundation

typealias Callback = () -> Void

class State {
    
    var ticker  = Ticker()
    var options = Options()
    var updated = Date()
    
    func start(onReady: @escaping Callback) {
        let api = "https://api.coinmarketcap.com/v1/ticker/?limit=100"
        let url = URL(string: api)
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if error != nil {
                print("Error fetching API")
                print(error)
                return
            }
            
            if let text = String(data: data!, encoding: .utf8) {
                print("Parsing json")
                self.updated = Date()
                self.ticker  = Ticker(json: text)
                self.ticker.show()
                //self.ticker.show2()
                DispatchQueue.main.async { onReady() }
            } else {
                print("Error parsing JSON")
                print(error)
            }
        }
        
        task.resume()
    }
}
