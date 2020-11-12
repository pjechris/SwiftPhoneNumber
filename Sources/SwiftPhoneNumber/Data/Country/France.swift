
public extension PhoneCountry {
    /// France
    static let fra = Self(code: "33",
                         nationalCode: "0",
                         destinations: [
                            .init(type: .fixed, areaCodes: 1...3, length: 9),
                            .init(type: .mobile, areaCodes: 6...7, length: 9)
    ])
    
    /// Guadeloupe
    static let glp = Self(code: "590",
                         nationalCode: "0",
                         destinations: [
                            .init(type: .mobile, areaCodes: 690...691, length: 9)
                         ])
    
    /// French Guiana
    static let guf = Self(code: "594",
                         nationalCode: "0",
                         destinations: [
                            .init(type: .mobile, areaCodes: 694...694, length: 9)
                         ])
    
    /// New Caledonia
    static let ncl = Self(code: "687",
                         destinations: [
                            .init(type: .mobile, areaCodes: 7...9, length: 6)
                         ])
    
    /// Monaco
    static let mco = Self(code: "377",
                         destinations: [
                            .init(type: .mobile, areaCodes: 4...4, length: 8)
                         ])
    
    /// Martinique
    static let mtq = Self(code: "596",
                         nationalCode: "0",
                         destinations: [
                            .init(type: .mobile, areaCodes: 696...697, length: 9)
                         ])
    
    /// French Polynesia
    static let pyf = Self(code: "689",
                         destinations: [
                            .init(type: .mobile, areaCodes: 87...87, length: 8),
                            .init(type: .mobile, areaCodes: 89...89, length: 8)
                         ])
    
    /// Reunion
    static let reu = Self(code: "262",
                         nationalCode: "0",
                         destinations: [
                            .init(type: .mobile, areaCodes: 639...639, length: 9),
                            .init(type: .mobile, areaCodes: 692...693, length: 9)
                         ])
    
    /// Saint Pierre and Miquelon
    static let spm = Self(code: "508",
                         destinations: [
                            .init(type: .mobile, areaCodes: 55...55, length: 6)
                         ])
    
    /// Wallis and Futuna
    static let wlf = Self(code: "681",
                         destinations: [
                            .init(type: .mobile, areaCodes: 82...83, length: 6)
                         ])
}

public extension PhoneNumberFormatter {
    static let fra = Self("\(.code)\(1) \(2) \(2) \(2) \(2)")
}
