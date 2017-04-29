//
//  Ticker.swift
//  Altcoins
//
//  Created by Mac Mini on 4/27/17.
//  Copyright © 2017 Armonia. All rights reserved.
//

import Foundation

class Ticker {
    var coins = [Coin]()
    var count: Int { get { return coins.count } }

    convenience init(json: String) {
        self.init()
        let list = json.parseList()
        
        for item in list {
            let coin = Coin()
            coin.id       = (item["id"]        as? String) ?? ""
            coin.name     = (item["name"]      as? String) ?? ""
            coin.symbol   = (item["symbol"]    as? String) ?? ""
            coin.rank     = (item["rank"]      as? Int)    ?? 0
            coin.priceUsd = Double((item["price_usd"] as? String) ?? "0.0") ?? 0.0
            coin.priceBtc = Double((item["price_btc"] as? String) ?? "0.0") ?? 0.0
            coins.append(coin)
        }
    }
    
    func show() {
        for coin in coins {
            print(coin.text)
        }
    }
    
    func show2() {
        for coin in coins {
            print(coin.text2)
        }
    }
}

class Coin {
    var id          = "bitcoin"
    var name        = "Bitcoin"
    var symbol      = "BTC"
    var rank        = 0
    var priceUsd    = 0.0
    var priceBtc    = 0.0
    var volumeUsd   = 0.0
    var marketUsd   = 0.0
    var available   = 0.0
    var totalSupply = 0.0
    var change01h   = 0.0
    var change24h   = 0.0
    var change07d   = 0.0
    var trend       = 0    // 0:same 1:up 2: down
    var updated     = 0
    
    var text:  String { get { return String(format: "%5@ %25@ %10.04f", symbol.pad(5), name.pad(25), priceUsd) } }
    var text2: String { get { return "\(symbol.pad(5)) \(name.pad(20)) \(priceUsd.format(10,4))" } }
    
}


// End
