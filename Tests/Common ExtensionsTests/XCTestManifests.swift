import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Common_ExtensionsTests.allTests),
    ]
}
#endif
