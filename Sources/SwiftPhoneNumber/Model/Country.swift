import Foundation

/// Country information in general (flag, abrevation, ...). Nothing specific to a number
/// Note: Countries used are those as defined in ISO standards. They MIGHT not be actual countries but rather regions
/// of another country (like France DOM-TOM for instance).
/// - See: https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes
@dynamicMemberLookup
public enum Country: CaseIterable {
    case americanSamoa
    case anguilla
    case antiguaAndBarbuda
    case bahamas
    case barbados
    case bermuda
    case britishVirginIslands
    case canada
    case caymanIslands
    case dominica
    case dominicanRepublic
    case france
    case frenchGuiana
    case frenchPolynesia
    case guadeloupe
    case guam
    case grenada
    case jamaica
    case newCaledonia
    case northernMarianaIslands
    case martinique
    case monaco
    case montserrat
    case puertoRico
    case reunion
    case saintKittsAndNevis
    case saintLucia
    case saintPierreAndMiquelon
    case saintVincentAndTheGrenadines
    case sintMaarten
    case trinidadAndTobago
    case turksAndCaicosIslands
    case unitedStates
    case virginIslands
    case wallisAndFutuna

    public subscript<T>(dynamicMember keyPath: KeyPath<CountryData, T>) -> T {
        return data[keyPath: keyPath]
    }
}

private extension Country {
    var data: CountryData {
        switch self {
        case .americanSamoa:
            return CountryData("American Samoa", alpha2Code: "AS", alpha3Code: "ASM", emoji: "🇦🇸")
        case .anguilla:
            return CountryData("Anguilla", alpha2Code: "AI", alpha3Code: "AIA", emoji: "🇦🇮")
        case .antiguaAndBarbuda:
            return CountryData("Antigua and Barbuda", alpha2Code: "AQ", alpha3Code: "ATA", emoji: "🇦🇬")
        case .bahamas:
            return CountryData("Bahamas", alpha2Code: "BS", alpha3Code: "BHS", emoji: "🇧🇸")
        case .barbados:
            return CountryData("Barbados", alpha2Code: "BB", alpha3Code: "BRB", emoji: "🇧🇧")
        case .bermuda:
            return CountryData("Bermuda", alpha2Code: "BM", alpha3Code: "BMU", emoji: "🇧🇲")
        case .britishVirginIslands:
            return CountryData("British Virgin Islands", alpha2Code: "VG", alpha3Code: "VGB", emoji: "🇻🇬")
        case .canada:
            return CountryData("Canada", alpha2Code: "CA", alpha3Code: "CAN", emoji: "🇨🇦")
        case .caymanIslands:
            return CountryData("Cayman Islands", alpha2Code: "KY", alpha3Code: "CYM", emoji: "🇰🇾")
        case .france:
            return CountryData("France", alpha2Code: "FR", alpha3Code: "FRA", emoji: "🇫🇷")
        case .frenchGuiana:
            return CountryData("French Guiana", alpha2Code: "GF", alpha3Code: "GUF", emoji: "🇬🇫")
        case .frenchPolynesia:
            return CountryData("French Polynesia", alpha2Code: "PF", alpha3Code: "PYF", emoji: "🇵🇫")
        case .dominica:
            return CountryData("Dominica", alpha2Code: "DM", alpha3Code: "DMA", emoji: "🇩🇲")
        case .dominicanRepublic:
            return CountryData("Dominican Republic", alpha2Code: "DO", alpha3Code: "DOM", emoji: "🇩🇴")
        case .grenada:
            return CountryData("Grenada", alpha2Code: "GD", alpha3Code: "GRD", emoji: "🇬🇩")
        case .guadeloupe:
            return CountryData("Guadeloupe", alpha2Code: "GP", alpha3Code: "GLP", emoji: "🇬🇵")
        case .guam:
            return CountryData("Guam", alpha2Code: "GU", alpha3Code: "GUM", emoji: "🇬🇺")
        case .jamaica:
            return CountryData("Jamaica", alpha2Code: "JM", alpha3Code: "JAM", emoji: "🇯🇲")
        case .martinique:
            return CountryData("Martinique", alpha2Code: "MQ", alpha3Code: "MTQ", emoji: "🇲🇶")
        case .monaco:
            return CountryData("Monaco", alpha2Code: "MC", alpha3Code: "MCO", emoji: "🇲🇨")
        case .montserrat:
            return CountryData("Montserrat", alpha2Code: "MS", alpha3Code: "MSR", emoji: "🇲🇸")
        case .newCaledonia:
            return CountryData("New Caledonia", alpha2Code: "NC", alpha3Code: "NCL", emoji: "🇳🇨")
        case .northernMarianaIslands:
            return CountryData("Northern Mariana Islands", alpha2Code: "MP", alpha3Code: "MNP", emoji: "🇲🇵")
        case .puertoRico:
            return CountryData("Puerto Rico", alpha2Code: "PR", alpha3Code: "PRI", emoji: "🇵🇷")
        case .reunion:
            return CountryData("Réunion", alpha2Code: "RE", alpha3Code: "REU", emoji: "🇷🇪")
        case .saintKittsAndNevis:
            return CountryData("Saint Kitts and Nevis", alpha2Code: "KN", alpha3Code: "KNA", emoji: "🇰🇳")
        case .saintLucia:
            return CountryData("Saint Lucia", alpha2Code: "LC", alpha3Code: "LCA", emoji: "🇱🇨")
        case .saintPierreAndMiquelon:
            return CountryData("Saint Pierre and Miquelon", alpha2Code: "PM", alpha3Code: "SPM", emoji: "🇵🇲")
        case .saintVincentAndTheGrenadines:
            return CountryData("Saint Vincent and the Grenadines", alpha2Code: "VC", alpha3Code: "VCT", emoji: "🇻🇨")
        case .sintMaarten:
            return CountryData("Sint Maarten", alpha2Code: "SX", alpha3Code: "SXM", emoji: "🇸🇽")
        case .trinidadAndTobago:
            return CountryData("Trinidad and Tobago", alpha2Code: "TT", alpha3Code: "TTO", emoji: "🇹🇹")
        case .turksAndCaicosIslands:
            return CountryData("Turks and Caicos Islands", alpha2Code: "TC", alpha3Code: "TCA", emoji: "🇹🇨")
        case .unitedStates:
            return CountryData("United States of America", alpha2Code: "US", alpha3Code: "USA", emoji: "🇺🇸")
        case .virginIslands:
            return CountryData("Virgin Islands", alpha2Code: "VI", alpha3Code: "VIR", emoji: "🇻🇮")
        case .wallisAndFutuna:
            return CountryData("Wallis and Futuna", alpha2Code: "WF", alpha3Code: "WLF", emoji: "🇼🇫")
        }
    }
}

/// Used internally by Country to store each country data
public struct CountryData {
    /// (Capitalized) Country name in English. Can be used as-is or as a translation key
    public let name: String
    /// emoji flag
    public let emoji: String
    /// country 2-letter uppercased code
    public let alpha2Code: String
    /// country 3-letter uppercased code
    public let alpha3Code: String

    init(_ name: String, alpha2Code: String, alpha3Code: String, emoji: String) {
        self.name = name
        self.alpha2Code = alpha2Code.uppercased()
        self.alpha3Code = alpha3Code.uppercased()
        self.emoji = emoji
    }
}
