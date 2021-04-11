
public extension PhoneNumberFormatter {
    static let french = Self("\(.code)\(1) \(2) \(2) \(2) \(2)")
    
    static let nanp = Self(international: "\(.code)-\(3)-\(3)-\(4)", national: "(\(3)) \(3)-\(4)")
}
