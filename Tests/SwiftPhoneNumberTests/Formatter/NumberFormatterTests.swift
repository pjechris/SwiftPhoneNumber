import XCTest
import SwiftPhoneNumber

class NumberFormatterTests: XCTestCase {
    let testCountry = PhoneCountry(code: "543",
                                   nationalCode: "6",
                                   destinations: [
                                    .init(type: .fixed, areaCodes: 2...5, length: 9)
                                   ])
    lazy var number = try! PhoneNumber(number: "+543223456789", in: [testCountry])
    
    func test__string__subscriberGroupedBy__itGroupSubscriber() {
        let text = NumberFormatter(pattern: [
            .group(subscriberBy: 2, separator: "-")
        ])
        .string(from: number)
        
        XCTAssertEqual(text, "22-34-56-78-9")
    }
    
    func test__string__subscriberMulitpleTimes__itOffsetSubscriberEachTime() {
        let text = NumberFormatter(pattern: [
            .subscriber(2),
            .separator(","),
            .subscriber(3)
        ])
        .string(from: number)
        
        XCTAssertEqual(text, "22,345")
    }
    
    func test__string__internationalCodeTooManyTimes__itHasNoEffect() {
        let text = NumberFormatter(pattern: [
            .internationalCode,
            .separator("/"),
            .internationalCode
        ])
        .string(from: number)
        
        XCTAssertEqual(text, "+543/")
    }
}
