import Foundation

// https://en.wikipedia.org/wiki/E.164
/// https://www.itu.int/rec/T-REC-E.164-201011-I/en
public struct PhoneNumber: Equatable {
    /// number associated country
    public let country: PhoneCountry
    
    /// user number (with no national prefix)
    public let subscriberNumber: String
    
    /// full number respecting E.164 standard (including "+" sign)
    public var number: String { return "+" + country.internationalCode + subscriberNumber }
    
    public init(number: String, in countries: [PhoneCountry]) throws {
        let result = try E164Parser.parsing(number, countries: countries)
        
        self.init(subscriberNumber: result.subscriberNumber, country: result.country)
    }
    
    fileprivate init(subscriberNumber: String, country: PhoneCountry) {
        self.subscriberNumber = subscriberNumber
        self.country = country
    }
}

public enum PhoneNumberError: Error {
    case unsupported
    case noMatchingCountry
    case missingCountry
    case invalidNationalCode
    case invalidLength
    // case invalidLength(country: PhoneCountry)
    case invalidDestination
    // case invalidDestination(country: PhoneCountry)
    case invalidCharacter
}


