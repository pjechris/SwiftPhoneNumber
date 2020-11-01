import Foundation

/// Help formatting a `PhoneNumber` into a `String` based on pattern rules
///
/// Example:
///
/// `NumberFormatter([.internationalCode, .subscriber(1), .separator(" "), group(subscriberBy: 2, separator: " "])`
/// would give "+331 02 03 04 05" with a french number
public struct NumberFormatter {
    /// Rules to define a pattern to display data from `PhoneNumber`
    public enum Rule {
        case internationalCode
        case prefixCode
        case separator(String)
        case subscriber(Int)
        case group(subscriberBy: Int, separator: String)
    }
    
    private let pattern: [Rule]
    
    /// - Parameter pattern: list of chained rules to create pattern
    public init(pattern: [Rule]) {
        self.pattern = pattern
    }
    
    /// Apply set of rules to number data
    public func string(from number: PhoneNumber) -> String {
        var subscriber = number.subscriberNumber
        var internationalCode = number.country.internationalCode
        var nationalCode = number.country.nationalCode ?? ""
        
        return pattern.reduce(into: "") { result, rule in
            switch rule {
            case .internationalCode where !internationalCode.isEmpty:
                result += "+" + internationalCode
                internationalCode.removeAll()
            case .prefixCode where !nationalCode.isEmpty:
                result += nationalCode
                nationalCode.removeAll()
            case let .separator(separator):
                result += separator
            case let .subscriber(count) where !subscriber.isEmpty:
                result += subscriber.prefix(count)
                subscriber.removeFirst(count)
            case let .group(count, separator) where !subscriber.isEmpty:
                result += subscriber.grouped(by: count, separator: separator)
                subscriber.removeAll()
            default:
                break
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

