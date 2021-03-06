import Foundation

/// https://en.wikipedia.org/wiki/E.164
/// https://www.itu.int/rec/T-REC-E.164-201011-I/en
public struct PhoneNumber: Equatable {
    public enum NumberType {
        case fixed
        case mobile
    }
    
    /// number associated country
    public let country: Country
    
    /// user number (with no national prefix)
    public let subscriberNumber: String
    
    /// full number respecting E.164 standard (including "+" sign)
    public var number: String { return "+" + country.phone.metadata.internationalCode + subscriberNumber }
    
    public init(number: String, for countries: [Country] = Country.allCases) throws {
        let result = try E164Parser.parsing(number, countries: countries)
        
        self.init(subscriberNumber: result.subscriberNumber, country: result.country)
    }
    
    fileprivate init(subscriberNumber: String, country: Country) {
        self.subscriberNumber = subscriberNumber
        self.country = country
    }
}


