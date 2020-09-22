import Foundation

extension CharacterSet {
    public static let phoneNumber = CharacterSet.decimalDigits.adding(character: "+")
    
    func adding(character: Unicode.Scalar) -> CharacterSet {
        var set = self
        _ = set.insert(character)
        return set
    }
}
