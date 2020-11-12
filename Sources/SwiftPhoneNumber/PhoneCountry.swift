import Foundation

/// Contain information about phone format for a country
/// Follow international standards
public struct PhoneCountry: Hashable {
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
        
        let name: String?
        let type: DestinationType?
        let areaCodes: AnyCollection<Int>
        /// destination length (hence without international nor national prefix)
        let length: Int
        
        public init(name: String? = nil, type: DestinationType? = nil, areaCodes: ClosedRange<Int>, length: Int) {
            self.init(name: name, type: type, areaCodes: AnyCollection(areaCodes), length: length)
        }
        
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
