import Foundation

// https://en.wikipedia.org/wiki/E.164
/// https://www.itu.int/rec/T-REC-E.164-201011-I/en
public struct PhoneNumber: Equatable {
    /// detected/associated number country
    public let country: PhoneCountry

    /// national number (with no national prefix)
    public let subscriberNumber: String

    /// full number respecting E.164 standard (including "+" sign)
    public var number: String { return "+" + country.internationalCode + subscriberNumber }

    fileprivate init(subcriberNumber: String, country: PhoneCountry) {
        self.subscriberNumber = subcriberNumber
        self.country = country
    }
}
