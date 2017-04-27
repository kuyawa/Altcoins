//
//  Utils.swift
//  Altcoins
//
//  Created by Mac Mini on 4/27/17.
//  Copyright © 2017 Armonia. All rights reserved.
//

import Foundation


typealias Datamap = [String: Any]
typealias Listmap = [Datamap]

extension String {
    
    func pad(_ n: Int, _ text: String = " ") -> String {
        let ini = 0
        return self.padding(toLength: n, withPad: text, startingAt: ini)
    }
    
    func parse() -> Datamap {
        var dixy = Datamap()
        
        do {
            let data = self.data(using: .utf8)!
            dixy = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Datamap
        } catch {
            print("JSON.error: ", error)
        }
        
        return dixy
    }

    func parseList() -> Listmap {
        var list = Listmap()
        
        do {
            let data = self.data(using: .utf8)!
            list = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Listmap
        } catch {
            print("JSON.error: ", error)
        }
        
        return list
    }
    
}

extension Double {
    func format(_ num: Int, _ dec: Int = 2) -> String {
        let fmt = "\(num).\(dec)"
        return String(format: "%\(fmt)f", self)
    }
}

extension Date {
    static func epoch(_ time: Int) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(time))
    }
}


// END
