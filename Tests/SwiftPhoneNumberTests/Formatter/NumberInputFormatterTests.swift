import XCTest
@testable import SwiftPhoneNumber

class NumberInputFormatterTests: XCTestCase {
    let testCountry = PhoneCountry(code: "44",
                                   nationalCode: "0",
                                   destinations: [
                                    .init(type: .fixed, areaCodes: 1...4, length: 4)
                                   ])
    
    func test__unformatting_itRemoveUnauthorizedCharacters() {
        let formatter = PhoneNumberInputFormatter(countries: [])
        
        XCTAssertEqual(formatter.unformatting(text: "+01 02/03-04(05)ABCD"), "+0102030405")
    }
}
