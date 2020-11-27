
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
        
        .asm: .nanp,
        .gum: .nanp,
        .mnp: .nanp,
        .pri: .nanp,
        .vir: .nanp,
        .usa: .nanp,
        .can: .nanp,
        .aia: .nanp,
        .atg: .nanp,
        .bhs: .nanp,
        .bmu: .nanp,
        .brb: .nanp,
        .cym: .nanp,
        .dma: .nanp,
        .dom: .nanp,
        .grd: .nanp,
        .jam: .nanp,
        .kna: .nanp,
        .lca: .nanp,
        .maf: .nanp,
        .msr: .nanp,
        .tca: .nanp,
        .tto: .nanp,
        .vct: .nanp,
        .vgb: .nanp
    ]
}

public extension Array where Element == PhoneCountry {
    static let `default`: Self = Array(Dictionary<PhoneCountry, PhoneNumberFormatter>.default.keys)
}
