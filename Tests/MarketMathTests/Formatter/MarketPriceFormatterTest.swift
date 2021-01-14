//
//  File.swift
//
//
//  Created by Vitali Kurlovich on 30.12.20.
//

import Foundation
@testable import MarketMath
import XCTest

extension Int: MarketPriceValue {}

final class MarketPriceFormatterTest: XCTestCase {
    func testNumberOfFractionSymbol() {
        let formatter = MarketPriceFormatter()
        formatter.pipValue = 1

        XCTAssertEqual(formatter.numberOfFractionSymbol, 0)

        formatter.pipValue = 0.1
        XCTAssertEqual(formatter.numberOfFractionSymbol, 1)

        formatter.pipValue = 0.01
        XCTAssertEqual(formatter.numberOfFractionSymbol, 2)

        formatter.pipValue = 0.001
        XCTAssertEqual(formatter.numberOfFractionSymbol, 3)

        formatter.pipValue = 0.0001
        XCTAssertEqual(formatter.numberOfFractionSymbol, 4)

        formatter.pipValue = 0.00001
        XCTAssertEqual(formatter.numberOfFractionSymbol, 5)
    }

    func testFormattingInteger() {
        let formatter = MarketPriceFormatter()

        let value: Int = 8_997_350
        let value_2: Int = 899_735_000

        formatter.usesGroupingSeparator = true
        formatter.groupingSeparator = " "
        formatter.groupingSize = 3

        formatter.decimalSeparator = "."

        formatter.usesGroupingSeparator = true

        XCTAssertNotNil(formatter.string(for: value))
        XCTAssertEqual(formatter.string(for: value)!, "8 997 350")

        XCTAssertNotNil(formatter.string(for: value_2))
        XCTAssertEqual(formatter.string(for: value_2)!, "899 735 000")

        formatter.usesGroupingSeparator = false

        XCTAssertNotNil(formatter.string(for: value))
        XCTAssertEqual(formatter.string(for: value)!, "8997350")

        XCTAssertNotNil(formatter.string(for: value_2))
        XCTAssertEqual(formatter.string(for: value_2)!, "899735000")

        formatter.pipValue = 0.01

        formatter.usesGroupingSeparator = true

        XCTAssertNotNil(formatter.string(for: value))
        XCTAssertEqual(formatter.string(for: value)!, "89 973.50")

        XCTAssertNotNil(formatter.string(for: value_2))
        XCTAssertEqual(formatter.string(for: value_2)!, "8 997 350.00")

        formatter.usesGroupingSeparator = false

        XCTAssertNotNil(formatter.string(for: value))
        XCTAssertEqual(formatter.string(for: value)!, "89973.50")

        XCTAssertNotNil(formatter.string(for: value_2))
        XCTAssertEqual(formatter.string(for: value_2)!, "8997350.00")

        formatter.pipValue = 0.0001
        formatter.usesGroupingSeparator = true

        XCTAssertNotNil(formatter.string(for: value))
        XCTAssertEqual(formatter.string(for: value)!, "899.7350")

        XCTAssertNotNil(formatter.string(for: value_2))
        XCTAssertEqual(formatter.string(for: value_2)!, "89 973.5000")

        formatter.usesGroupingSeparator = false

        XCTAssertNotNil(formatter.string(for: value))
        XCTAssertEqual(formatter.string(for: value)!, "899.7350")

        XCTAssertNotNil(formatter.string(for: value_2))
        XCTAssertEqual(formatter.string(for: value_2)!, "89973.5000")
    }
}
