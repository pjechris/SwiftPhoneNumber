import XCTest
import SwiftPhoneNumber

class NumberFormatterTests: XCTestCase {
    let testCountry = PhoneCountry(code: "543",
                                   nationalCode: "6",
                                   destinations: [
                                    .init(type: .fixed, areaCodes: 2...5, length: 9)
                                   ])
    lazy var number = try! PhoneNumber(number: "+543223456789", in: [testCountry])
    
    func test__apply__subscriberGroup__itGroup() {
        let text = NumberFormatter(.subscriber(groupedBy: 2, separator: "-")).apply(to: number)
        
        XCTAssertEqual(text, "22-34-56-78-9")
    }
}
