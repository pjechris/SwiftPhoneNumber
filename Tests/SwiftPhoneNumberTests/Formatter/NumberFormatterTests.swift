import XCTest
import SwiftPhoneNumber

class NumberFormatterTests: XCTestCase {
    let testCountry = PhoneCountry(code: "543",
                                   nationalCode: "6",
                                   destinations: [
                                    .init(type: .fixed, areaCodes: 2...5, length: 9)
                                   ])
    lazy var number = try! PhoneNumber(number: "+543223456789", in: [testCountry])
    
    func test__string__patternIsSubscriberGroupedBy__itGroupSubscriber() {
        let text = NumberFormatter(
            international: [.group(subscriberBy: 2, separator: "-")],
            national: []
        )
        .string(from: number, format: .international)
        
        XCTAssertEqual(text, "22-34-56-78-9")
    }
    
    func test__string__patternIsSubscriberMulitpleTimes__itOffsetSubscriberEachTime() {
        let text = NumberFormatter(
            international: [.subscriber(2), .separator(","), .subscriber(3)],
            national: []
        )
        .string(from: number, format: .international)
        
        XCTAssertEqual(text, "22,345")
    }
    
    func test__string__patternUseInternationalCodeManyTimes__itHasNoEffect() {
        let text = NumberFormatter(
            international: [.internationalCode, .separator("/"), .internationalCode],
            national: []
        )
        .string(from: number, format: .international)
        
        XCTAssertEqual(text, "+543/")
    }
}
