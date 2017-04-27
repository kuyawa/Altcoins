//
//  Config.swift
//  Altcoins
//
//  Created by Mac Mini on 4/27/17.
//  Copyright © 2017 Armonia. All rights reserved.
//

import Foundation

class Config {
    var lastUpdate   = Date()
    var defaultCoins = "BTC, LTC, MNR, ETH, DSH"
    var watchedCoins = "BTC, LTC, MNR, ETH, DSH"
    
    func load() {
        lastUpdate   = Date.epoch(UserDefaults.standard.integer(forKey: "lastUpdate"))
        watchedCoins = UserDefaults.standard.string(forKey: "watchedCoins") ?? defaultCoins
    }
    
    func save() {
        UserDefaults.standard.set(lastUpdate.timeIntervalSince1970, forKey: "lastUpdate")
        UserDefaults.standard.set(watchedCoins, forKey: "watchedCoins")
    }
}
