import Foundation

/// Text formatter allowing to format a user input as `Number` using `InputFormatter`
public struct PhoneNumberInputFormatter: InputFormatter {
    public typealias Value = PhoneNumber
    
    private let formatters: [PhoneCountry: PhoneNumberFormatter]
    private let countries: [PhoneCountry]
    
    public init(countriesFormatter: [PhoneCountry: PhoneNumberFormatter] = .default) {
        self.formatters = countriesFormatter
        self.countries = Array(countriesFormatter.keys)
    }
    
    public func unformatting(text: String) -> String {
        text.filter {
            [" ", "-", "(", ")", "/"].contains(String($0)) == false
        }
    }
    
    public func convert(unformatted: String) throws -> PhoneNumber {
        try PhoneNumber(number: unformatted, from: countries)
    }
    
    public func formatting(unformatted: String, value: Result<PhoneNumber, Error>) -> String? {
        let format: PhoneNumberFormatter.Format = unformatted.hasPrefix("+") ? .international : .national
        
        switch value {
        case let .failure(PhoneNumberParseError.incorrectLength(country)):
            return formatters[country]?.partial(string: unformatted, country: country, format: format)
        case .failure:
            return nil
        case .success(let number):
            return formatters[number.country]?.string(from: number, format: format)
        }
    }
}
