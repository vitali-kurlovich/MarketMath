//
//  File.swift
//
//
//  Created by Vitali Kurlovich on 26.01.21.
//

import Foundation

protocol MarketVolume {
    associatedtype Volume: MarketVolumeValue
    var ask: Volume { get }
    var bid: Volume { get }
}
