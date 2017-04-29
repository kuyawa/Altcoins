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
            coin.id          = item["id"].string
            coin.name        = item["name"].string
            coin.symbol      = item["symbol"].string
            coin.rank        = item["rank"].int
            coin.priceUsd    = item["price_usd"].double
            coin.priceBtc    = item["price_btc"].double
            coin.volumeUsd   = Double((item["24h_volume_usd"]     as? String) ?? "0.0") ?? 0.0
            coin.marketUsd   = Double((item["market_cap_usd"]     as? String) ?? "0.0") ?? 0.0
            coin.available   = Double((item["available_supply"]   as? String) ?? "0.0") ?? 0.0
            coin.totalSupply = Double((item["total_supply"]       as? String) ?? "0.0") ?? 0.0
            coin.totalSupply = Double((item["total_supply"]       as? String) ?? "0.0") ?? 0.0
            coin.change01h   = Double((item["percent_change_1h"]  as? String) ?? "0.0") ?? 0.0
            coin.change24h   = Double((item["percent_change_24h"] as? String) ?? "0.0") ?? 0.0
            coin.change24h   = Double((item["percent_change_7d"]  as? String) ?? "0.0") ?? 0.0
            coin.trend       = (coin.change01h == 0 ? 0 : (coin.change01h > 0 ? 1 : 2))
            coin.updated     = Int((item["last_updated"] as? String) ?? "0") ?? 0
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
    
    // ALTEX 100 - Altcoins market index
    func altex100() -> Int {
        func f(_ num: Double) -> String { return String(format: "%20.4f", num) }
        func s(_ sym: String) -> String { return String(format: "%5@", sym) }
        
        let N = 100
        var totalUsd = 0.0
        var totalVol = 0.0
        var totalMkt = 0.0
        
        var i = 0
        for item in coins {
            totalUsd += item.priceUsd
            totalVol += item.volumeUsd
            totalMkt += item.marketUsd
            i += 1
            if i > N { break }
        }
        
        var altex = 0.0
        
        i = 0
        for item in coins {
            let sym = item.symbol
            let usd = item.priceUsd
            let vol = item.volumeUsd
            let mkt = item.marketUsd
            let idx = mkt / usd
            let vmk = vol * 100 / mkt
            let pmk = mkt * 100 / totalMkt
            let fct = totalMkt / 1000000000
            
            // Altex
            // alt = mkt/vol * mkt*100/tmkt
            let alt = vmk * pmk * fct
            altex += alt
            
            print(s(sym), f(usd), f(vol), f(mkt), f(idx), f(pmk), f(alt))
            
            i += 1
            if i > N { break }
        }
        
        print("---")
        print("USD: ", totalUsd)
        print("VOL: ", totalVol)
        print("MKT: ", totalMkt)
        print("ALTEX+100: ", Int(altex))
        print("OK")
        
        return Int(altex)
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
