import Foundation

/// Text formatter allowing to format a user input as `Number` using `InputFormatter`
public struct NumberInputFormatter: InputFormatter {
    public typealias Value = PhoneNumberInput
    
    private let formatters: [PhoneCountry: NumberFormatter]
    private let countries: [PhoneCountry]
    
    public init(countriesFormatter: [PhoneCountry: NumberFormatter]) {
        self.formatters = countriesFormatter
        self.countries = Array(countriesFormatter.keys)
    }
    
    public func unformatting(text: String) -> String {
        text.filter {
            [" ", "-", "(", ")", "/"].contains(String($0)) == false
        }
    }
    
    public func convert(unformatted: String) throws -> PhoneNumberInput {
        try PhoneNumberInput(number: unformatted, from: countries)
    }
    
    public func formatting(unformatted: String, value: Result<PhoneNumberInput, Error>) -> String? {
        switch value {
        case .failure:
            return nil
        case .success(let input):
            return formatters[input.number.country]?.string(from: input.number, format: input.format)
        }
    }
}

extension NumberInputFormatter {
    /// A `PhoneNumber` coming from a user input
    public struct PhoneNumberInput {
        let number: PhoneNumber
        let format: NumberFormatter.Format
        
        init(number: String, from countries: [PhoneCountry]) throws {
            self.number = try .init(number: number, in: countries)
            self.format = number.hasPrefix("+") ? .international : .national
        }
    }
}
