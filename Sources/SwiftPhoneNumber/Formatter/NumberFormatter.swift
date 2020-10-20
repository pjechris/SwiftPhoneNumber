import Foundation

/// Help transforming a `PhoneNumber` into a `String` based on pattern rules
public struct NumberFormatter {
    /// Available rules to define the pattern. Each rule allow to print data from `PhoneNumber`
    /// into a specific manner
    public enum Rule {
        case internationalCode
//        case prefixCode
        case separator(String)
        case subscriber(prefix: Int)
        case subscriber(groupedBy: Int, separator: String)
    }
    
    private let rules: [Rule]
    
    public init(_ rules: Rule...) {
        self.rules = rules
    }
    
    /// Apply set of rules to number data
    public func apply(to number: PhoneNumber) -> String {
        rules.reduce(into: "") { result, rule in
            switch rule {
            case .internationalCode:
                result += "+" + number.country.internationalCode
            case .separator(let separator):
                result += separator
            case let .subscriber(groupedBy: count, separator):
                result += number.subscriberNumber.grouped(by: count, separator: separator)
            }
        }
    }
}

private extension String {
    func grouped(by offset: Int, separator: String) -> String {
        enumerated().reduce(into: "") { result, iterator in
            let addSeparator = iterator.offset % offset == 0 && iterator.offset > 0

            result += (addSeparator ? separator : "") + String(iterator.element)
        }
    }
}

