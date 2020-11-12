import Foundation

/// Help formatting a `PhoneNumber` into a `String` based on pattern rules
///
/// Example:
///
/// `NumberFormatter(international: "\(.code)\(1) \(2) \(2) \(2) \(2)")`
/// would give "+331 02 03 04 05" with a french number
public struct PhoneNumberFormatter {
    /// Rules to define a pattern to display data from `PhoneNumber`
    public enum Rule: Equatable {
        /// international or national code depending on selected `Format`
        case code
        /// add a literal string to formatter
        case literal(String)
        /// take at most Int argument from subscriber number
        case subscriber(Int)
        /// group subscriber number by packer of count using separator
        case subscriberGrouped(by: Int, separator: String)
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
    
    /// Init formatter with same pattern for both internaional and national format
    public init(_ pattern: [Rule]) {
        self.init(international: pattern, national: pattern)
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
        let pattern: [Rule]
        var code: String
        var subscriber = subscriber
        
        switch format {
        case .international:
            pattern = patterns.international
            code = "+" + country.internationalCode
        case .national:
            pattern = patterns.national
            code = country.nationalCode ?? ""
        }
        
        return pattern.reduce(into: "") { result, rule in
            switch rule {
            case .code where !code.isEmpty:
                result += code
                code.removeAll()
            case let .literal(separator) where !subscriber.isEmpty:
                result += separator
            case let .subscriber(count) where !subscriber.isEmpty:
                result += subscriber.prefix(count)
                subscriber.removeFirst(min(count, subscriber.count))
            case let .subscriberGrouped(count, separator) where !subscriber.isEmpty:
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

