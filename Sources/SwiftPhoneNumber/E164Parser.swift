import Foundation

/// Possible errors when parsing a `Number`
public enum PhoneNumberParseError: Error {
    /// number contains non valid characters (other than 0..9 or +)
    case invalidCharacter
    /// no country found matching provided number
    case noCountryMatch
    /// number has matched but more than one country
    case manyMatches(in: [Country])
    /// number has incorrect length for matched country
    case incorrectLength(country: Country)
}

enum E164Parser {
    typealias ParsedNumber = (subscriberNumber: String, country: Country)
    
    /// Parse a e164 number by trying to determine its matching country and match its rules
    /// - Throws: `PhoneNumberError` if no country matching or if number is not a valid number
    static func parsing(_ number: String, countries: [Country]) throws -> ParsedNumber {
        if number.hasPrefix("+") {
            return try parsing(international: String(number.dropFirst()), countries: countries)
        }
        
        return try parsing(national: number, countries: countries)
    }
    
    /// Parse a international number
    private static func parsing(international number: String, countries: [Country]) throws -> ParsedNumber {
        let internationalCode = { (metadata: PhoneCountry) in
            number.starts(with: metadata.internationalCode)
        }
        
        let areaCode = { (metadata: PhoneCountry) -> Bool in
            let number = number.dropFirst(metadata.internationalCode.count)
            
            return metadata.destinations
                .map(\.areaCodes)
                .contains { areaCodes in
                    // we know we have at least one because Destination force it
                    let areaCode = Int(number.prefix(areaCodes.first!.digitsCount))
                    
                    return areaCode.map(areaCodes.contains) ?? false
            }
        }
        
        return try validate(number,
                            for: countries,
                            conforming: internationalCode, areaCode,
                            reduce: { number, metadata in
                                String(number.dropFirst(metadata.internationalCode.count))
        })
    }
    
    /// Parse a national number
    private static func parsing(national number: String, countries: [Country]) throws -> ParsedNumber {
        let nationalCode = { (metadata: PhoneCountry) in
            metadata.nationalCode.map(number.hasPrefix) ?? true
        }
        
        let areaCode = { (metadata: PhoneCountry) -> Bool in
            let number = String(number.dropFirst(metadata.nationalCode?.count ?? 0))
            
            return metadata.destinations
                .map(\.areaCodes)
                .contains { areaCodes in
                    // we know we have at least one because Destination force it
                    let areaCode = Int(number.prefix(areaCodes.first!.digitsCount))
                    
                    return areaCode.map(areaCodes.contains) ?? false
            }
        }
        
        return try validate(number,
                            for: countries,
                            conforming: nationalCode, areaCode,
                            reduce: { number, country in
                                String(number.dropFirst(country.nationalCode?.count ?? 0))
        })
    }
    
    /// Validate number is coming from a country of `countries`
    private static func validate(_ number: String,
                                 for countries: [Country],
                                 conforming filters: (PhoneCountry) -> Bool...,
        reduce: (String, PhoneCountry) -> String) throws -> ParsedNumber {
        
        guard number.satisfy(.decimalDigits) else {
            throw PhoneNumberParseError.invalidCharacter
        }

        let countries = countries.filter(\.phone.metadata, by: filters)
        let results = countries
            .map { (subscriberNumber: reduce(number, $0.phone.metadata), country: $0) }
            .filter { $0.subscriberNumber.count == $0.country.phone.metadata.destinations.first!.length }
            .sorted { $0.country.phone.metadata.priority > $1.country.phone.metadata.priority }
        
        guard let result = results.first else {
            guard let country = countries.first, countries.count == 1 else {
                throw PhoneNumberParseError.noCountryMatch
            }
            
            throw PhoneNumberParseError.incorrectLength(country: country)
        }
        
        guard results.count == 1 || results[1].country.phone.metadata.priority < result.country.phone.metadata.priority else {
            throw PhoneNumberParseError.manyMatches(in: countries)
        }
        
        return result
    }
}

extension String {
    fileprivate func satisfy(_ characterSet: CharacterSet) -> Bool {
        unicodeScalars.allSatisfy(characterSet.contains)
    }
}

extension Array {
    fileprivate func filter<T>(_ keyPath: KeyPath<Element, T>, by filters: [(T) -> Bool]) -> [Element] {
        filters.reduce(into: self) { countries, filter in
            countries = countries.filter { filter($0[keyPath: keyPath]) }
        }
    }

    fileprivate func filter(by filters: [(Element) -> Bool]) -> [Element] {
        filter(\.self, by: filters)
    }
}

extension Int {
    /// number of digits the number has. For exemple 599 is 3 digits long (5,9,9)
    var digitsCount: Int {
        var tmp = self
        var count = 0
        
        while tmp != 0 {
            tmp = tmp / 10
            count += 1
        }
        
        return count
    }
}
