
public extension PhoneCountry {
    static let france = Self(code: "33",
                             nationalCode: "0",
                             destinations: [
                                .init(type: .fixed, areaCodes: 1...3, length: 9),
                                .init(type: .mobile, areaCodes: 6...7, length: 9)
                             ])
    
    static let guadeloupe = Self(code: "590",
                                 nationalCode: "0",
                                 destinations: [
                                    .init(type: .mobile, areaCodes: 690...691, length: 9)
                                 ])
    
    static let frenchGuiana = Self(code: "594",
                                   nationalCode: "0",
                                   destinations: [
                                    .init(type: .mobile, areaCodes: 694...694, length: 9)
                                   ])
    
    static let newCaledonia = Self(code: "687",
                                   destinations: [
                                    .init(type: .mobile, areaCodes: 7...9, length: 6)
                                   ])
    
    static let monaco = Self(code: "377",
                             destinations: [
                                .init(type: .mobile, areaCodes: 4...4, length: 8)
                             ])
    
    static let martinique = Self(code: "596",
                                 nationalCode: "0",
                                 destinations: [
                                    .init(type: .mobile, areaCodes: 696...697, length: 9)
                                 ])
    
    static let frenchPolynesia = Self(code: "689",
                                      destinations: [
                                        .init(type: .mobile, areaCodes: 87...87, length: 8),
                                        .init(type: .mobile, areaCodes: 89...89, length: 8)
                                      ])
    
    static let reunion = Self(code: "262",
                              nationalCode: "0",
                              destinations: [
                                .init(type: .mobile, areaCodes: 639...639, length: 9),
                                .init(type: .mobile, areaCodes: 692...693, length: 9)
                              ])
    
    static let saintPierreAndMiquelon = Self(code: "508",
                                             destinations: [
                                                .init(type: .mobile, areaCodes: 55...55, length: 6)
                                             ])
    
    static let wallisAndFutuna = Self(code: "681",
                                      destinations: [
                                        .init(type: .mobile, areaCodes: 82...83, length: 6)
                                      ])
}
