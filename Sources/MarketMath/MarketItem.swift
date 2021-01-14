//
//  File.swift
//
//
//  Created by Vitali Kurlovich on 29.12.20.
//

import Foundation

protocol MarketItem {}

protocol MarketValue: Numeric, Comparable {}

protocol MarketPriceValue: MarketValue {}

protocol MarketVolumeValue: MarketValue {}
