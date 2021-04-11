import XCTest
@testable import SwiftPhoneNumber

class NumberFormatterTests: XCTestCase {
    let number = try! PhoneNumber(number: "+33602030405", for: [.france])
    
    func test__string__patternIsSubscriberGroupedBy__itGroupSubscriber() {
        let text = PhoneNumberFormatter(
            international: [.subscriberGrouped(by: 2, separator: "-")],
            national: []
        )
        .string(from: number, style: .international)
        
        XCTAssertEqual(text, "60-20-30-40-5")
    }
    
    func test__string__patternIsSubscriberMulitpleTimes__itOffsetSubscriberEachTime() {
        let text = PhoneNumberFormatter(
            international: "\(2),\(3)",
            national: []
        )
        .string(from: number, style: .international)
        
        XCTAssertEqual(text, "60,203")
    }
    
    func test__string__patternUseInternationalCodeManyTimes__itHasNoEffect() {
        let text = PhoneNumberFormatter(
            international: "\(.code)/\(.code)",
            national: []
        )
        .string(from: number, style: .international)
        
        XCTAssertEqual(text, "+33/")
    }
    
    func test__partial__formatNational__stringIsInternational__itFormatCorrectly() {
        let metadata = PhoneCountry(code: "543",
                                    nationalCode: "6",
                                    destinations: [
                                        .init(type: .fixed, areaCodes: 2...5, length: 9)
                                    ])
        let text = PhoneNumberFormatter(
            international: [],
            national: "\(.code) \(2)-\(2)-\(2)-\(2)-\(1)"
        )
        .partial(string: "+5432345", style: .national, metadata: metadata)
        
        XCTAssertEqual(text, "6 23-45")
    }
    
    func test__partial__subscriberCountIsSupThanStringCount__itFormatString() {
        let metadata = PhoneCountry(code: "543",
                                    nationalCode: "6",
                                    destinations: [
                                        .init(type: .fixed, areaCodes: 2...5, length: 9)
                                    ])
        let count = 5
        let text = PhoneNumberFormatter([.subscriber(count)])
            .partial(string: "+543\(String.init(repeating: "1", count: count - 1))", style: .national, metadata: metadata)
        
        XCTAssertEqual(text, "1111")
    }
}
