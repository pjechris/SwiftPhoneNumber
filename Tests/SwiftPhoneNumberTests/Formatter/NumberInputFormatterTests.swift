import XCTest
@testable import SwiftPhoneNumber

class NumberInputFormatterTests: XCTestCase {
    let testCountry = PhoneCountry(code: "44",
                                   nationalCode: "0",
                                   destinations: [
                                    .init(type: .fixed, areaCodes: 1...4, length: 4)
                                   ])
    let numberFormatter = NumberFormatter(
        international: [],
        national: [.prefixCode, .subscriber(1), .separator(" "), .group(subscriberBy: 2, separator: "-")]
    )
    
    func test__unformatting_itRemoveSeparators() {
        let formatter = NumberInputFormatter(countriesFormatter: [:])
        let separators = [" ", "-", "(", ")", "/"]
        
        separators.forEach {
            let number = ["01", "02", "03", "04"].joined(separator: $0)
            
            XCTAssertEqual(
                formatter.unformatting(text: number),
                "01020304"
            )
        }
    }
    
    func test__unformatting_itPreserveInternationalSign() {
        let formatter = NumberInputFormatter(countriesFormatter: [:])
        
        XCTAssertEqual(
            formatter.unformatting(text: "+33 6"),
            "+336"
        )
    }
}
