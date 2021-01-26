//
//  File.swift
//
//
//  Created by Vitali Kurlovich on 26.01.21.
//

import Foundation

protocol MarketValue: Numeric, Comparable {}

protocol MarketPriceValue: MarketValue {}

protocol MarketVolumeValue: MarketValue {}
