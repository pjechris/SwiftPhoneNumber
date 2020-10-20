import Foundation

/// Contain information about phone format for a country
/// Follow international standards
public struct PhoneCountry: Equatable {
    /// international code to dial to join the country. For example: "33" for metropolitan France
    public let internationalCode: String
    /// national prefix to dial when calling from the country. For example: "0" for metropolitan France
    public let nationalCode: String?
    
    public let destinations: Set<Destination>

    public init(code: String, nationalCode: String? = nil, destinations: Set<Destination>) {
        self.internationalCode = code
        self.nationalCode = nationalCode
        self.destinations = destinations
    }
}

public extension PhoneCountry {
    struct Destination: Hashable {
        public enum DestinationType {
            case fixed
            case mobile
        }
        
        let type: DestinationType
        let areaCodes: ClosedRange<Int>
        /// destination length (hence without international nor national prefix)
        let length: Int
        
        public init(type: DestinationType, areaCodes: ClosedRange<Int>, length: Int) {
            self.type = type
            self.areaCodes = areaCodes
            self.length = length
        }
    }
}
