import XCTest
@testable import Common_Extensions

final class Common_ExtensionsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Common_Extensions().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
