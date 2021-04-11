
import XCTest
@testable import SwiftPhoneNumber

class E164ParserTests: XCTestCase {
    func test__parsing__internationalNumber__itReturnSubscriberNumber() throws {
        let frNumber = "+33102030405"
        let result = try E164Parser.parsing(frNumber, countries: [.france])
        
        XCTAssertEqual(result.subscriberNumber, "102030405")
    }
    
    func test__parsing__internationalNumber__matchMultipleCountriesCode__ItReturnCountryMatchingAreaCode() throws {
        let usaArizonaNumber = "+14804567890"
        let result = try E164Parser.parsing(usaArizonaNumber, countries: [.canada, .unitedStates])
        
        XCTAssertEqual(result.country, .unitedStates)
    }
    
    func test__parsing__nationalNumber__withNationalCode__itReturnSubscriberNumber() throws {
        let nationalNumber = "0102030405"
        let result = try E164Parser.parsing(nationalNumber, countries: [.france])
        
        XCTAssertEqual(result.subscriberNumber, "102030405")
    }
    
    func test__parsing__nationalNumber__withNoNationalCode__itReturnCountry() throws {
        let bermudaNumber = "4414567890"
        let result = try E164Parser.parsing(bermudaNumber, countries: [.bermuda])
        
        XCTAssertEqual(result.country, .bermuda)
    }
    
    func test__parsing__nationalNumber__areaCodeIsOverlapping__differentLength__itReturnBiggestAreaCode() throws {
        // overlap on 0690 (guadeloupe) and 06 (france)
        let guadeloupeNumber = "0690456789"
        let result = try E164Parser.parsing(guadeloupeNumber, countries: [.france, .guadeloupe])
        
        XCTAssertEqual(result.country, .guadeloupe)
    }
    
    func test__parsing__partialNumber__containCountryAndDestination__itThrowInvalidLength() throws {
        XCTAssertThrowsError(
            try E164Parser.parsing("+336", countries: [.france]),
            "") {
            switch $0 {
            case PhoneNumberParseError.incorrectLength:
                break
            default:
                XCTFail("Expected NumberParseError.incorrectLength instead of \($0))")
            }
        }
        
    }
    
    func test__parsing__noMatch__itThrow() throws {
        XCTAssertThrowsError(
            try E164Parser.parsing("00723456789", countries: [.france]),
            "") {
            switch $0 {
            case PhoneNumberParseError.noCountryMatch:
                break
            default:
                XCTFail("Expected NumberParseError.noMatch instead of \($0))")
            }
        }
        
    }
}
