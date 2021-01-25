//
//  File.swift
//
//
//  Created by Vitali Kurlovich on 30.12.20.
//

import Foundation
import CoreFoundation

class MarketPriceFormatter: Formatter {
    var pipValue: Double = 1

    var formattingContext: Formatter.Context = .unknown {
        didSet {
            numberFormatter.formattingContext = formattingContext
            numberFormatter.numberStyle = .decimal
        }
    }

    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.formattingContext = self.formattingContext
        formatter.numberStyle = .decimal
        return formatter
    }()

    override func string(for obj: Any?) -> String? {
        let fractionSymbol = numberOfFractionSymbol

        numberFormatter.allowsFloats = fractionSymbol > 0

        numberFormatter.minimumFractionDigits = fractionSymbol
        numberFormatter.maximumFractionDigits = fractionSymbol

        return numberFormatter.string(for: obj)
    }

    func string<T: BinaryInteger>(for value: T?) -> String? {
        guard let value = value else {
            return string(for: nil)
        }

        let double = Double(value) * pipValue

        return string(for: double)
    }
#if !os(Linux)
    override func attributedString(for obj: Any, withDefaultAttributes attrs: [NSAttributedString.Key : Any]? = nil) -> NSAttributedString? {
        let fractionSymbol = numberOfFractionSymbol

        numberFormatter.allowsFloats = fractionSymbol > 0

        numberFormatter.minimumFractionDigits = fractionSymbol
        numberFormatter.maximumFractionDigits = fractionSymbol

//        guard let obj = obj else {
//            return NSAttributedString(string: nilSymbol, attributes: attrs)
//        }

        return numberFormatter.attributedString(for: obj, withDefaultAttributes: attrs)
    }

    
    func attributedString<T: BinaryInteger>(for value: T?, withDefaultAttributes attrs: [NSAttributedString.Key: Any]? = nil) -> NSAttributedString? {
        guard let value = value else {
            return NSAttributedString(string: nilSymbol, attributes: attrs)
        }

        let double = Double(value) * pipValue

        return attributedString(for: double, withDefaultAttributes: attrs)
    }
#endif
}

internal
extension MarketPriceFormatter {
    var numberOfFractionSymbol: Int {
        Int(round(-log10(pipValue)))
    }
}

extension MarketPriceFormatter {
    var locale: Locale {
        get {
            numberFormatter.locale
        }
        set {
            numberFormatter.locale = newValue
        }
    }
}

extension MarketPriceFormatter {
    var decimalSeparator: String {
        get {
            numberFormatter.decimalSeparator
        }

        set {
            numberFormatter.decimalSeparator = newValue
        }
    }
}

extension MarketPriceFormatter {
    var nilSymbol: String {
        get {
            numberFormatter.nilSymbol
        }

        set {
            numberFormatter.nilSymbol = newValue
        }
    }
}

extension MarketPriceFormatter {
    var usesGroupingSeparator: Bool {
        get {
            numberFormatter.usesGroupingSeparator
        }

        set {
            numberFormatter.usesGroupingSeparator = newValue
        }
    }

    var groupingSeparator: String {
        get {
            numberFormatter.groupingSeparator
        }

        set {
            numberFormatter.groupingSeparator = newValue
        }
    }
}

extension MarketPriceFormatter {
    var groupingSize: Int {
        get {
            numberFormatter.groupingSize
        }

        set {
            numberFormatter.groupingSize = newValue
        }
    }

    var secondaryGroupingSize: Int {
        get {
            numberFormatter.secondaryGroupingSize
        }

        set {
            numberFormatter.secondaryGroupingSize = newValue
        }
    }
}

/// Attributed string
#if !os(Linux)
extension MarketPriceFormatter {
    var textAttributesForNegativeValues: [String: Any]? {
        get {
            numberFormatter.textAttributesForNegativeValues
        }
        set {
            numberFormatter.textAttributesForNegativeValues = newValue
        }
    }

    var textAttributesForPositiveValues: [String: Any]? {
        get {
            numberFormatter.textAttributesForPositiveValues
        }
        set {
            numberFormatter.textAttributesForPositiveValues = newValue
        }
    }

    var textAttributesForNil: [String: Any]? {
        get {
            numberFormatter.textAttributesForNil
        }
        set {
            numberFormatter.textAttributesForNil = newValue
        }
    }

    var textAttributesForZero: [String: Any]? {
        get {
            numberFormatter.textAttributesForZero
        }
        set {
            numberFormatter.textAttributesForZero = newValue
        }
    }

    var textAttributesForNotANumber: [String: Any]? {
        get {
            numberFormatter.textAttributesForNotANumber
        }
        set {
            numberFormatter.textAttributesForNotANumber = newValue
        }
    }
}
#endif
