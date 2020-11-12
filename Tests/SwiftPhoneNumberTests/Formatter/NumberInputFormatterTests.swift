import XCTest
@testable import SwiftPhoneNumber

class NumberInputFormatterTests: XCTestCase {
    let testCountry = PhoneCountry(code: "44",
                                   nationalCode: "0",
                                   destinations: [
                                    .init(type: .fixed, areaCodes: 1...4, length: 4)
                                   ])
    let numberFormatter = PhoneNumberFormatter(
        international: [],
        national: "\(.code)\(1) \(2)-\(2)"
    )
    
    func test__unformatting_itRemoveSeparators() {
        let formatter = PhoneNumberInputFormatter(countriesFormatter: [:])
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
        let formatter = PhoneNumberInputFormatter(countriesFormatter: [:])
        
        XCTAssertEqual(
            formatter.unformatting(text: "+33 6"),
            "+336"
        )
    }
}
