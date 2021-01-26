//
//  File.swift
//
//
//  Created by Vitali Kurlovich on 26.01.21.
//

import Foundation

protocol MarketPrice {
    associatedtype Price: MarketPriceValue
    var ask: Price { get }
    var bid: Price { get }
}

extension MarketPrice {
    var spread: Price {
        bid - ask
    }
}
