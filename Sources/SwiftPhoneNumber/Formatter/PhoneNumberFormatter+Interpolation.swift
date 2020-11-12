import Foundation

extension Array: ExpressibleByStringLiteral, ExpressibleByStringInterpolation where Element == PhoneNumberFormatter.Rule {
    /// Generate a `Array<PhoneNumberFormatter.Rule>` based on a string content
    /// example: "\(.code)\(1) \(2) \(2) \(2) \(2)" is the same as
    /// [.code, .subscriber(1), .literal(" "), .subscriber(2), .literal(" "), .subscriber(2), .literal(" "), .subscriber(2), .literal(" "), .subscriber(2)]
    public struct RuleInterpolation: StringInterpolationProtocol {
        var rules: [PhoneNumberFormatter.Rule] = []
        
        public init(literalCapacity: Int, interpolationCount: Int) {
            
        }
        
        /// append literal as a rule `PhoneNumberFormatter.Rule.literal`
        public mutating func appendLiteral(_ string: String) {
            guard !string.isEmpty else {
                return
            }

            rules.append(.literal(string))
        }
        
        /// append number as a `PhoneNumberFormatter.Rule.subscriber`
        public mutating func appendInterpolation(_ subscriberCount: Int) {
            rules.append(.subscriber(subscriberCount))
        }
        
        /// append a `PhoneNumberFormatter.Rule.subscriber`
        public mutating func appendInterpolation(_ rule: PhoneNumberFormatter.Rule) {
            rules.append(rule)
        }
    }
    
    public init(stringLiteral value: String) {
        self.init([.literal(value)])
    }
    
    public init(stringInterpolation: RuleInterpolation) {
        self.init(stringInterpolation.rules)
    }
}

extension Array: ExpressibleByUnicodeScalarLiteral where Element == PhoneNumberFormatter.Rule {
    public typealias UnicodeScalarLiteralType = String
    
    public init(unicodeScalarLiteral value: String) {
        self.init([.literal(value)])
    }
}

extension Array: ExpressibleByExtendedGraphemeClusterLiteral where Element == PhoneNumberFormatter.Rule {
    public typealias ExtendedGraphemeClusterLiteralType = String
}

