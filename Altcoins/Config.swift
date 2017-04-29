//
//  Config.swift
//  Altcoins
//
//  Created by Mac Mini on 4/27/17.
//  Copyright © 2017 Armonia. All rights reserved.
//

import Foundation

struct Options {
    var coins = 0  // top10, top100, all
    var index = 0  // usd, btc, vol, mkt
    var trend = 0  // 1hr, 24hr, 7d
    var order = 0  // asc, desc
}

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
    
    // On API refresh call this method
    func saveLastUpdate() {
        lastUpdate = Date()
        UserDefaults.standard.set(lastUpdate.timeIntervalSince1970, forKey: "lastUpdate")
    }
}
