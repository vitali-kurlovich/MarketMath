import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(MarketPriceFormatterTest.allTests),
        ]
    }
#endif
