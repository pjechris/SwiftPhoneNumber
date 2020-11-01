
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
        let result = try E164Parser.parsing(i18nNumber, countries: [testCountry])
        
        XCTAssertEqual(result.subscriberNumber, "234567890")
    }
    
    func test__parsing__numberIsNational__itReturnSubscriberNumber() throws {
        let nationalNumber = "2234567890"
        let result = try E164Parser.parsing(nationalNumber, countries: [testCountry])
        
        XCTAssertEqual(result.subscriberNumber, "234567890")
    }
    
    func test__parsing__numberIsInternational__multipleCountriesMatching__ItReturnCountryMatchingAreaCode() throws {
        let countryWithSimilarI18nCode = PhoneCountry(code: testCountry.internationalCode,
                                                      destinations: [
                                                        .init(type: .fixed, areaCodes: 6...7, length: 9)]
        )
        
        let result = try E164Parser.parsing("+288234567890", countries: [countryWithSimilarI18nCode, testCountry])
        
        XCTAssertEqual(result.country, testCountry)
    }
    
    func test__parsing__numberIsPartial__withCountryAndDestination__itThrowInvalidLength() throws {
        XCTAssertThrowsError(
            try E164Parser.parsing("+2883", countries: [testCountry]),
            "") {
            switch $0 {
            case NumberParseError.incorrectLength:
                break
            default:
                XCTFail("Expected NumberParseError.incorrectLength instead of \($0))")
            }
        }
        
    }
    
    func test__parsing__noMatch__itThrow() throws {
        XCTAssertThrowsError(
            try E164Parser.parsing("007001002003", countries: [testCountry, testCountry]),
            "") {
            switch $0 {
            case NumberParseError.noMatch:
                break
            default:
                XCTFail("Expected NumberParseError.noMatch instead of \($0))")
            }
        }
        
    }
}
