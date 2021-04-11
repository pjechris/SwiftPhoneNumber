import Foundation

/// Text formatter allowing to format a user input as `PhoneNumber` using `InputFormatter`
public struct PhoneNumberInputFormatter: InputFormatter {
    public typealias Value = PhoneNumber

    private let countries: [Country]
    
    public init(countries: [Country] = Country.allCases) {
        self.countries = countries
    }
    
    public func unformatting(text: String) -> String {
        let validCharacters = CharacterSet.decimalDigits.union(CharacterSet(charactersIn: "+"))
        
        return text.filter {
            $0.unicodeScalars.allSatisfy(validCharacters.contains)
        }
    }
    
    public func convert(unformatted: String) throws -> PhoneNumber {
        try PhoneNumber(number: unformatted, for: countries)
    }
    
    public func formatting(unformatted: String, value: Result<PhoneNumber, Error>) -> String? {
        let style: PhoneNumberFormatter.FormattingStyle = unformatted.hasPrefix("+") ? .international : .national
        
        switch value {
        case let .failure(PhoneNumberParseError.incorrectLength(country)):
            return country.phone.format.partial(string: unformatted, style: style, metadata: country.phone.metadata)
        case .failure:
            return unformatted
        case .success(let number):
            return number.country.phone.format.string(from: number, style: style)
        }
    }
}
