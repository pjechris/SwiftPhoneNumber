
public extension Dictionary where Key == PhoneCountry, Value == PhoneNumberFormatter {
    static let `default`: Self = [
        .fra: .fra,
        .guf: .fra,
        .glp: .fra,
        .mco: .fra,
        .ncl: .fra,
        .pyf: .fra,
        .spm: .fra,
        .reu: .fra,
        .wlf: .fra,
        
        .asm: .usa,
        .gum: .usa,
        .mnp: .usa,
        .pri: .usa,
        .vir: .usa,
        .usa: .usa
    ]
}

public extension Array where Element == PhoneCountry {
    static let `default`: Self = Array(Dictionary<PhoneCountry, PhoneNumberFormatter>.default.keys)
}
