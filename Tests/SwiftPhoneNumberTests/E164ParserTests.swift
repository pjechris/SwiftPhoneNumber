
import XCTest
@testable import SwiftPhoneNumber

class E164ParserTests: XCTestCase {
    let testCountry = PhoneCountry(code: "288",
                                   nationalCode: "2",
                                   destinations: [
                                    .init(type: .fixed, areaCodes: 2...5, length: 9)
    ])
    
    func test__parsing__numberIsInternational__itReturnSubscriberNumber() throws {
        let i18nNumber = "+288234567890"
        let result = try PhoneNumber.parsing(i18nNumber, countries: [testCountry])
        
        XCTAssertEqual(result.subscriberNumber, "234567890")
    }
    
    func test__parsing__numberIsNational__itReturnSubscriberNumber() throws {
        let nationalNumber = "2234567890"
        let result = try PhoneNumber.parsing(nationalNumber, countries: [testCountry])
        
        XCTAssertEqual(result.subscriberNumber, "234567890")
    }
    
    func test__parsing__multipleCountriesMatching__ItReturnCountryMatchingAreaCode() throws {
        let countryWithSimilarI18nCode = PhoneCountry(code: testCountry.internationalCode,
                                                      destinations: [
                                                        .init(type: .fixed, areaCodes: 6...7, length: 9)]
        )
        
        let result = try PhoneNumber.parsing("+288234567890", countries: [countryWithSimilarI18nCode, testCountry])
        
        XCTAssertEqual(result.country, testCountry)
    }
}
