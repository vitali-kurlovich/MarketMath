//
//  File.swift
//
//
//  Created by Vitali Kurlovich on 30.12.20.
//

import Foundation

import PcgRandom

/// Geometric Brownian motion
public
struct GBM<Value: BinaryFloatingPoint, ElapsedTime: BinaryFloatingPoint> {
    let initialValue: Value
    let expected: Value
    let deviation: Value

    private var randomGenerator: Pcg64Random
    private var lastValue: Value

    public
    init(initialValue: Value = 0,
         seed: UInt64 = 42,
         expected: Value,
         deviation: Value)
    {
        self.initialValue = initialValue
        lastValue = initialValue
        self.expected = expected
        self.deviation = deviation
        randomGenerator = Pcg64Random(seed: seed)
    }

    public mutating
    func next(_ elapsedTime: ElapsedTime) -> Value {
        let gbm = expected * Value(elapsedTime) + deviation * random() * Value(sqrt(elapsedTime))

        lastValue = gbm * lastValue + lastValue
        return lastValue
    }

    private mutating
    func random() -> Value {
        let rnd = Double.random(in: 0.0 ..< 1.0, using: &randomGenerator)
        return Value(rnd)
    }
}
