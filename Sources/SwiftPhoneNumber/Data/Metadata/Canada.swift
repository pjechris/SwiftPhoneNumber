import Foundation

public extension PhoneCountry {
    /// Canada
    static let canada = Self(code: "1",
                             destinations: [
                                .init(name: "Alberta", areaCodes: 403, 780, 825, 587, length: 10),
                                .init(name: "British Columbia", areaCodes: 236, 778, 250, 604, length: 10),
                                .init(name: "Manitoba", areaCodes: 204, 431, length: 10),
                                .init(name: "New Brunswick", areaCodes: 506, length: 10),
                                .init(name: "Newfoundland", areaCodes: 709, length: 10),
                                .init(name: "Northwest Territories", areaCodes: 867, length: 10),
                                .init(name: "Nova Scotia", areaCodes: 902, 782, length: 10),
                                .init(name: "Nunavut", areaCodes: 867, length: 10),
                                .init(name: "Ontario", areaCodes: 437, 905, 249, 343, 416, 519, 647, 365, 548, 705, 807, 226, 289, 613, length: 10),
                                .init(name: "Prince Edward Island", areaCodes: 902, 782, length: 10),
                                .init(name: "Quebec", areaCodes: 819, 514, 581, 438, 418, 450, 873, 367, 579, length: 10),
                                .init(name: "Saskatchewan", areaCodes: 306, 639, length: 10),
                                .init(name: "Yukon", areaCodes: 867, length: 10)
                             ])
}
