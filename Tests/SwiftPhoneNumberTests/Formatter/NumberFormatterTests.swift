import XCTest
@testable import SwiftPhoneNumber

class NumberFormatterTests: XCTestCase {
    let testCountry = PhoneCountry(code: "543",
                                   nationalCode: "6",
                                   destinations: [
                                    .init(type: .fixed, areaCodes: 2...5, length: 9)
                                   ])
    lazy var number = try! PhoneNumber(number: "+543223456789", from: [testCountry])
    
    func test__string__patternIsSubscriberGroupedBy__itGroupSubscriber() {
        let text = PhoneNumberFormatter(
            international: [.subscriberGrouped(by: 2, separator: "-")],
            national: []
        )
        .string(from: number, format: .international)
        
        XCTAssertEqual(text, "22-34-56-78-9")
    }
    
    func test__string__patternIsSubscriberMulitpleTimes__itOffsetSubscriberEachTime() {
        let text = PhoneNumberFormatter(
            international: "\(2),\(3)",
            national: []
        )
        .string(from: number, format: .international)
        
        XCTAssertEqual(text, "22,345")
    }
    
    func test__string__patternUseInternationalCodeManyTimes__itHasNoEffect() {
        let text = PhoneNumberFormatter(
            international: "\(.code)/\(.code)",
            national: []
        )
        .string(from: number, format: .international)
        
        XCTAssertEqual(text, "+543/")
    }
    
    func test__partial__formatNational__stringIsInternational__itFormatCorrectly() {
        let text = PhoneNumberFormatter(
            international: [],
            national: "\(.code) \(2)-\(2)-\(2)-\(2)-\(1)"
        )
        .partial(string: "+5432345", country: testCountry, format: .national)
        
        XCTAssertEqual(text, "6 23-45")
    }
    
    func test__partial__subscriberCountIsSupThanStringCount__itFormatString() {
        let count = 5
        let text = PhoneNumberFormatter([.subscriber(count)])
            .partial(string: "+543\(String.init(repeating: "1", count: count - 1))", country: testCountry, format: .national)
        
        XCTAssertEqual(text, "1111")
    }
}
