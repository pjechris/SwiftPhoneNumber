import Foundation

public extension PhoneCountry {
    /// Anguilla
    static let aia = Self(code: "1", destinations: [.init(areaCodes: 264, length: 10)])
    
    /// Antigua and Barbuda
    static let atg = Self(code: "1", destinations: [.init(areaCodes: 268, length: 10)])
    
    /// Bahamas
    static let bhs = Self(code: "1", destinations: [.init(areaCodes: 242 , length: 10)])
    
    /// Bermuda
    static let bmu = Self(code: "1", destinations: [.init(areaCodes: 441, length: 10)])
    
    /// Barbados
    static let brb = Self(code: "1", destinations: [.init(areaCodes: 246, length: 10)])
    
    /// Cayman Islands
    static let cym = Self(code: "1", destinations: [.init(areaCodes: 345, length: 10)])
    
    /// Dominica
    static let dma = Self(code: "1", destinations: [.init(areaCodes: 767, length: 10)])
    
    /// Dominican Republic
    static let dom = Self(code: "1", destinations: [.init(areaCodes: 809, 829, 849, length: 10)])
    
    /// Grenada
    static let grd = Self(code: "1", destinations: [.init(areaCodes: 473, length: 10)])
    
    /// Jamaica
    static let jam = Self(code: "1", destinations: [.init(areaCodes: 658, 876, length: 10)])
    
    /// Saint Kitts and Nevis
    static let kna = Self(code: "1", destinations: [.init(areaCodes: 869, length: 10)])
    
    /// Saint Lucia
    static let lca = Self(code: "1", destinations: [.init(areaCodes: 758, length: 10)])
    
    /// Sint Maarten
    static let maf = Self(code: "1", destinations: [.init(areaCodes: 721, length: 10)])
    
    /// Montserrat
    static let msr = Self(code: "1", destinations: [.init(areaCodes: 664, length: 10)])
    
    /// Turks and Caicos Islands
    static let tca = Self(code: "1", destinations: [.init(areaCodes: 649, length: 10)])
    
    /// Trinidad and Tobago
    static let tto = Self(code: "1", destinations: [.init(areaCodes: 868, length: 10)])
    
    /// Saint Vincent and the Grenadines
    static let vct = Self(code: "1", destinations: [.init(areaCodes: 784, length: 10)])

    /// British Virgin Islands
    static let vgb = Self(code: "1", destinations: [.init(areaCodes: 284, length: 10)])
}

public extension PhoneNumberFormatter {
    static let nanp = PhoneNumberFormatter(international: "\(.code)-\(3)-\(3)-\(4)",
                                           national: "(\(3)) \(3)-\(4)")
}
