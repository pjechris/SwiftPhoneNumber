import Foundation

/// Help formatting a `PhoneNumber` into a `String` based on pattern rules
///
/// Example:
///
/// `NumberFormatter([.internationalCode, .subscriber(1), .separator(" "), group(subscriberBy: 2, separator: " "])`
/// would give "+331 02 03 04 05" with a french number
public struct PhoneNumberFormatter {
    /// Rules to define a pattern to display data from `PhoneNumber`
    public enum Rule {
        case internationalCode
        case prefixCode
        case separator(String)
        case subscriber(Int)
        case group(subscriberBy: Int, separator: String)
    }
    
    /// Formats into which a `Number` can be rendered
    public enum Format {
        case international
        case national
    }
    
    private let patterns: (international: [Rule], national: [Rule])
    
    /// - Parameter international: list of chained rules to create pattern in international format
    /// - Parameter international: list of chained rules to create pattern in national format
    public init(international: [Rule], national: [Rule]) {
        self.patterns = (international, national)
    }
        
    /// Transform number into `String` for given format
    /// - Parameter number: the number to stringify
    /// - Parameter format: the number desired format
    public func string(from number: PhoneNumber, format: Format) -> String {
        let subscriber = number.subscriberNumber
        
        return string(from: subscriber, country: number.country, format: format)
    }
    
    /// Apply string formatting to a partial string number
    func partial(string: String, country: PhoneCountry, format: Format) -> String {
        let subscriber = string.hasPrefix("+")
            ? string.dropFirst("+".count + country.internationalCode.count)
            : string.dropFirst(country.nationalCode?.count ?? 0)
        
        return self.string(from: String(subscriber), country: country, format: format)
    }

    private func string(from subscriber: String, country: PhoneCountry, format: Format) -> String {
        let pattern = self.pattern(for: format)
        
        var subscriber = subscriber
        var internationalCode = country.internationalCode
        var nationalCode = country.nationalCode ?? ""
        
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
    
    private func pattern(for format: Format) -> [Rule] {
        switch format {
        case .international:
            return patterns.international
        case .national:
            return patterns.national
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

