
extension Country {
    typealias Phone = (format: PhoneNumberFormatter, metadata: PhoneCountry)

    var phone: Phone {
        switch self {
        case .americanSamoa:
            return (format: .nanp, metadata: .americanSamoa)
        case .anguilla:
            return (format: .nanp, metadata: .anguilla)
        case .antiguaAndBarbuda:
            return (format: .nanp, metadata: .antiguaAndBarbuda)
        case .bahamas:
            return (format: .nanp, metadata: .bahamas)
        case .barbados:
            return (format: .nanp, metadata: .barbados)
        case .bermuda:
            return (format: .nanp, metadata: .bermuda)
        case .britishVirginIslands:
            return (format: .nanp, metadata: .britishVirginIslands)
        case .canada:
            return (format: .nanp, metadata: .canada)
        case .caymanIslands:
            return (format: .nanp, metadata: .caymanIslands)
        case .dominica:
            return (format: .nanp, metadata: .dominica)
        case .dominicanRepublic:
            return (format: .nanp, metadata: .dominicanRepublic)
        case .france:
            return (format: .french, metadata: .france)
        case .frenchGuiana:
            return (format: .french, metadata: .frenchGuiana)
        case .frenchPolynesia:
            return (format: .french, metadata: .frenchPolynesia)
        case .guadeloupe:
            return (format: .french, metadata: .guadeloupe)
        case .guam:
            return (format: .nanp, metadata: .guam)
        case .grenada:
            return (format: .nanp, metadata: .grenada)
        case .jamaica:
            return (format: .nanp, metadata: .jamaica)
        case .newCaledonia:
            return (format: .nanp, metadata: .newCaledonia)
        case .northernMarianaIslands:
            return (format: .nanp, metadata: .northernMarianaIslands)
        case .martinique:
            return (format: .french, metadata: .martinique)
        case .monaco:
            return (format: .french, metadata: .monaco)
        case .montserrat:
            return (format: .nanp, metadata: .montserrat)
        case .puertoRico:
            return (format: .nanp, metadata: .puertoRico)
        case .reunion:
            return (format: .french, metadata: .reunion)
        case .saintKittsAndNevis:
            return (format: .nanp, metadata: .saintKittsAndNevis)
        case .saintLucia:
            return (format: .nanp, metadata: .saintLucia)
        case .saintPierreAndMiquelon:
            return (format: .french, metadata: .saintPierreAndMiquelon)
        case .saintVincentAndTheGrenadines:
            return (format: .nanp, metadata: .saintVincentAndTheGrenadies)
        case .sintMaarten:
            return (format: .nanp, metadata: .sintMaarten)
        case .trinidadAndTobago:
            return (format: .nanp, metadata: .trinidadAndTobago)
        case .turksAndCaicosIslands:
            return (format: .nanp, metadata: .turksAndCaicosIslands)
        case .unitedStates:
            return (format: .nanp, metadata: .unitedStates)
        case .virginIslands:
            return (format: .nanp, metadata: .virginIslands)
        case .wallisAndFutuna:
            return (format: .french, metadata: .wallisAndFutuna)
        }
    }
}
