
public extension Dictionary where Key == PhoneCountry, Value == PhoneNumberFormatter {
    static let `default`: Self = [
        .france: .french,
        .frenchGuiana: .french,
        .guadeloupe: .french,
        .monaco: .french,
        .newCaledonia: .french,
        .frenchPolynesia: .french,
        .saintPierreAndMiquelon: .french,
        .reunion: .french,
        .wallisAndFutuna: .french,
        
        .americanSamoa: .nanp,
        .guam: .nanp,
        .northernMarianaIslands: .nanp,
        .puertoRico: .nanp,
        .virginIslands: .nanp,
        .unitedStates: .nanp,
        .canada: .nanp,
        .anguilla: .nanp,
        .antiguaAndBarbuda: .nanp,
        .bahamas: .nanp,
        .bermuda: .nanp,
        .barbados: .nanp,
        .caymanIslands: .nanp,
        .dominica: .nanp,
        .dominicanRepublic: .nanp,
        .grenada: .nanp,
        .jamaica: .nanp,
        .saintKittsAndNevis: .nanp,
        .saintLucia: .nanp,
        .sintMaarten: .nanp,
        .montserrat: .nanp,
        .turksAndCaicosIslands: .nanp,
        .trinidadAndTobago: .nanp,
        .saintVincentAndTheGrenadies: .nanp,
        .britishVirginIslands: .nanp
    ]
}

public extension Array where Element == PhoneCountry {
    static let `default`: Self = Array(Dictionary<PhoneCountry, PhoneNumberFormatter>.default.keys)
}
