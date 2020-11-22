import Foundation

/// Contain information about phone format for a country
/// Follow international standards
public struct PhoneCountry: Hashable {
    /// international code to dial to join the country. For example: "33" for metropolitan France
    public let internationalCode: String
    /// national prefix to dial when calling from the country. For example: "0" for metropolitan France
    public let nationalCode: String?
    /// reachable numbers from this country
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
        
        /// A name for this destination. "Alaska" or "California" for instance
        let name: String?
        let type: DestinationType?
        /// Geographic codes associated to this destination
        let areaCodes: AnyCollection<Int>
        /// destination subscriber number length
        /// (hence without international nor national prefix but with areCode included).
        /// For instance USA destination length is 10
        let length: Int
        
        /// Create a Destination with a range as area codes.
        /// For example `areaCodes: 100...200` will consider all values from 100 to 200 as being into the destination
        public init(name: String? = nil, type: DestinationType? = nil, areaCodes: ClosedRange<Int>, length: Int) {
            self.init(name: name, type: type, areaCodes: AnyCollection(areaCodes), length: length)
        }
        
        /// Create a Destination with a variadic array of areaCodes
        /// For example `areaCodes: 100, 150, 200` will only consider value 100, 150, 200 as being into the destination
        public init(name: String? = nil, type: DestinationType? = nil, areaCodes: Int..., length: Int) {
            self.init(name: name, type: type, areaCodes: AnyCollection(areaCodes), length: length)
        }
        
        init(name: String?, type: DestinationType?, areaCodes: AnyCollection<Int>, length: Int) {
            self.name = name
            self.type = type
            self.areaCodes = areaCodes
            self.length = length
        }
        
        public static func == (lhs: PhoneCountry.Destination, rhs: PhoneCountry.Destination) -> Bool {
            lhs.name == rhs.name
                && lhs.type == rhs.type
                && lhs.length == rhs.length
                && lhs.areaCodes.count == rhs.areaCodes.count
                && lhs.areaCodes.allSatisfy(rhs.areaCodes.contains)
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(type)
            hasher.combine(length)
            hasher.combine(Array(areaCodes))
        }
    }
}
