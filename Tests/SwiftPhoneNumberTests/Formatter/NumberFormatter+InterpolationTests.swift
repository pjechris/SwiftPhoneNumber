import Foundation
import XCTest
@testable import SwiftPhoneNumber

class NumberFormatterInterpolationTests: XCTestCase {
    func test__init__withLiteral__itAppendAsRules() {
        let rules: [PhoneNumberFormatter.Rule] = "\(3)-\(2)-\(2)"
        
        XCTAssertEqual(rules, [.subscriber(3), .literal("-"), .subscriber(2), .literal("-"), .subscriber(2)])
    }
}
