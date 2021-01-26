//
//  File.swift
//
//
//  Created by Vitali Kurlovich on 29.12.20.
//

import Foundation

protocol MarketItem {
    var date: Date { get }
}

protocol MarketItemSequence: Sequence where Self.Element: MarketItem {}

protocol MarketItemCandle {
    associatedtype Item: MarketItem

    var open: Item { get }
    var close: Item { get }
    var low: Item { get }
    var hight: Item { get }
}
