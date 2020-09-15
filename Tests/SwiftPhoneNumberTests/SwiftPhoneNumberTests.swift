import XCTest
@testable import SwiftPhoneNumber

final class SwiftPhoneNumberTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftPhoneNumber().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
