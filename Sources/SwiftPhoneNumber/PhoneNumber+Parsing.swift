import Foundation

extension PhoneNumber {
    typealias ParsedNumber = (subscriberNumber: String, country: PhoneCountry)
    
    static func parsing(_ number: String, countries: [PhoneCountry]) throws -> ParsedNumber {
        if number.hasPrefix("+") {
            return try parsing(international: String(number.dropFirst()), countries: countries)
        }
        
        return try parsing(national: number, countries: countries)
    }
    
    private static func parsing(international number: String, countries: [PhoneCountry]) throws -> ParsedNumber {
        let internationalCode = { (country: PhoneCountry) in
            number.starts(with: country.internationalCode)
        }
        
        // TODO
        let areaCode = { (country: PhoneCountry) in
            country.destinations
                .map(\.areaCodes)
                .contains { _ in true }
        }
        
        return try validate(number,
                            for: countries,
                            conforming: internationalCode, areaCode,
                            reduce: { number, country in
                                String(number.dropFirst(country.internationalCode.count))
        })
    }
    
    private static func parsing(national number: String, countries: [PhoneCountry]) throws -> ParsedNumber {
        let nationalCode = { (country: PhoneCountry) in
            country.nationalCode.map(number.hasPrefix) ?? false
        }
        
        // TODO
        let areaCode = { (country: PhoneCountry) in
            country.destinations
                .map(\.areaCodes)
                .contains { _ in true }
        }
        
        return try validate(number,
                            for: countries,
                            conforming: nationalCode, areaCode,
                            reduce: { number, country in
                                String(number.dropFirst(country.nationalCode!.count))
        })
    }
    
    /// Parse **international** number by trying to determine its matching country
    /// - Throws: `PhoneNumberError` if no country matching or if number is not in international format
    private static func validate(_ number: String,
                                 for countries: [PhoneCountry],
                                 conforming filters: (PhoneCountry) -> Bool...,
        reduce: (String, PhoneCountry) -> String) throws -> ParsedNumber {
        
        guard number.satisfy(.decimalDigits) else {
            throw PhoneNumberError.invalidCharacter
        }
        
        let countries = countries.filter(by: filters)
        
        guard let country = countries.first, countries.count == 1 else {
            throw PhoneNumberError.noMatchingCountry
        }
        
        let number = reduce(number, country)
        
        // FIXME use matching destination instead of first
        guard number.count == country.destinations.first!.length else {
            throw PhoneNumberError.invalidLength
        }
        
        return (subscriberNumber: number, country: country)
    }
}

extension String {
    fileprivate func satisfy(_ characterSet: CharacterSet) -> Bool {
        unicodeScalars.allSatisfy(characterSet.contains)
    }
}

extension Array {
    fileprivate func filter(by filters: [(Element) -> Bool]) -> [Element] {
        filters.reduce(into: self) { countries, byFilter in
            countries = countries.filter(byFilter)
        }
    }
}
