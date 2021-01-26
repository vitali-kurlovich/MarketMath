//
//  File.swift
//
//
//  Created by Vitali Kurlovich on 26.01.21.
//

import Foundation

protocol Interpolator {
    associatedtype Value: FloatingPoint

    func value<T: Sequence>(sequence: T) -> Value? where T.Element == Value
}

struct SMA<Value: FloatingPoint>: Interpolator {
    func value<T>(sequence: T) -> Value? where T: Sequence, Self.Value == T.Element {
        var n: Value = 0
        var sma: Value = 0

        for p in sequence {
            n += 1
            sma += p
        }

        guard n > 0 else {
            return nil
        }

        return sma / n
    }
}

struct WMA<Value: FloatingPoint>: Interpolator {
    func value<T>(sequence: T) -> Value? where T: Sequence, Self.Value == T.Element {
        var n: Value = 0
        for _ in sequence {
            n += 1
        }

        var i: Value = 0
        var wma: Value = 0

        for p in sequence {
            wma += (n - i) * p
            i += 1
        }

        guard n > 0 else {
            return nil
        }

        return 2 * wma / (n * (n + 1))
    }
}

struct EMA {}

struct MACD {}
