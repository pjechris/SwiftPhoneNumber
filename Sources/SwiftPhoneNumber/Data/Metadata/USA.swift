import Foundation

/// from https://www.allareacodes.com/area_code_listings_by_state.htm
public extension PhoneCountry {
    static let americanSamoa = Self(code: "1", destinations: [.init(areaCodes: 684, length: 10)])
    
    static let guam = Self(code: "1", destinations: [.init(areaCodes: 671, length: 10)])
    
    static let northernMarianaIslands = Self(code: "1", destinations: [.init(areaCodes: 670, length: 10)])
    
    static let puertoRico = Self(code: "1", destinations: [.init(areaCodes: 787, 939, length: 10)])
    
    static let unitedStates = Self(code: "1",
                                   destinations: [
                                    .init(name: "Alabama", areaCodes: 205, 251, 256, 334, 938, length: 10),
                                    .init(name: "Alaska", areaCodes: 907, length: 10),
                                    .init(name: "Arizona", areaCodes: 480, 520, 602, 623, 928, length: 10),
                                    .init(name: "Arkansas", areaCodes: 479, 501, 870, length: 10),
                                    .init(name: "California",
                                          areaCodes: 209, 213, 279, 310, 323, 408, 415, 424, 442, 510, 530, 559, 562, 619, 626,
                                          628, 650, 657, 661, 669, 707, 714, 747, 760, 805, 818, 820, 831, 858, 909, 916, 925,
                                          949, 951,
                                          length: 10),
                                    .init(name: "Colorado", areaCodes: 303, 719, 720, 970, length: 10),
                                    .init(name: "Connecticut", areaCodes: 203, 475, 860, 959, length: 10),
                                    .init(name: "Delaware", areaCodes: 302, length: 10),
                                    .init(name: "Florida",
                                          areaCodes: 239, 305, 321, 352, 386, 407, 561, 727, 754, 772, 786, 813, 850, 863, 904,
                                          941, 954,
                                          length: 10),
                                    .init(name: "Georgia", areaCodes: 229, 404, 470, 478, 678, 706, 762, 770, 912, length: 10),
                                    .init(name: "Hawaii", areaCodes: 808, length: 10),
                                    .init(name: "Idaho", areaCodes: 208, 986, length: 10),
                                    .init(name: "Illinois", areaCodes: 217, 224, 309, 312, 331, 618, 630, 708, 773, 779, 815, 847, 872, length: 10),
                                    .init(name: "Indiana", areaCodes: 219, 260, 317, 463, 574, 765, 812, 930, length: 10),
                                    .init(name: "Iowa", areaCodes: 319, 515, 563, 641, 712, length: 10),
                                    .init(name: "Kansas", areaCodes: 316, 620, 785, 913, length: 10),
                                    .init(name: "Kentucky", areaCodes: 270, 364, 502, 606, 859, length: 10),
                                    .init(name: "Louisiana", areaCodes: 225, 318, 337, 504, 985, length: 10),
                                    .init(name: "Maine", areaCodes: 207, length: 10),
                                    .init(name: "Maryland", areaCodes: 240, 301, 410, 443, 667, length: 10),
                                    .init(name: "Massachusetts", areaCodes: 339, 351, 413, 508, 617, 774, 781, 857, 978, length: 10),
                                    .init(name: "Michigan", areaCodes: 231, 248, 269, 313, 517, 586, 616, 734, 810, 906, 947, 989, length: 10),
                                    .init(name: "Minnesota", areaCodes: 218, 320, 507, 612, 651, 763, 952, length: 10),
                                    .init(name: "Mississippi", areaCodes: 228, 601, 662, 769, length: 10),
                                    .init(name: "Missouri", areaCodes: 314, 417, 573, 636, 660, 816, length: 10),
                                    .init(name: "Montana", areaCodes: 406, length: 10),
                                    .init(name: "Nebraska", areaCodes: 308, 402, 531, length: 10),
                                    .init(name: "Nevada", areaCodes: 702, 725, 775, length: 10),
                                    .init(name: "New Hampshire", areaCodes: 603, length: 10),
                                    .init(name: "New Jersey", areaCodes: 201, 551, 609, 640, 732, 848, 856, 862, 908, 973, length: 10),
                                    .init(name: "New Mexico", areaCodes: 505, 575, length: 10),
                                    .init(name: "New York", areaCodes: 212, 315, 332, 347, 516, 518, 585, 607, 631, 646, 680, 716, 718, 838, 845, 914, 917, 929, 934, length: 10),
                                    .init(name: "North Carolina", areaCodes: 252, 336, 704, 743, 828, 910, 919, 980, 984, length: 10),
                                    .init(name: "North Dakota", areaCodes: 701, length: 10),
                                    .init(name: "Ohio", areaCodes: 216, 220, 234, 330, 380, 419, 440, 513, 567, 614, 740, 937, length: 10),
                                    .init(name: "Oklahoma", areaCodes: 405, 539, 580, 918, length: 10),
                                    .init(name: "Oregon", areaCodes: 458, 503, 541, 971, length: 10),
                                    .init(name: "Pennsylvania", areaCodes: 215, 223, 267, 272, 412, 445, 484, 570, 610, 717, 724, 814, 878, length: 10),
                                    .init(name: "Rhode Island", areaCodes: 401, length: 10),
                                    .init(name: "South Carolina", areaCodes: 803, 843, 854, 864, length: 10),
                                    .init(name: "South Dakota", areaCodes: 605, length: 10),
                                    .init(name: "Tennessee", areaCodes: 423, 615, 629, 731, 865, 901, 931, length: 10),
                                    .init(name: "Texas", areaCodes: 210, 214, 254, 281, 325, 346, 361, 409, 430, 432, 469, 512, 682, 713, 726, 737, 806, 817, 830, 832, 903, 915, 936, 940, 956, 972, 979, length: 10),
                                    .init(name: "Utah", areaCodes: 385, 435, 801, length: 10),
                                    .init(name: "Vermont", areaCodes: 802, length: 10),
                                    .init(name: "Virginia", areaCodes: 276, 434, 540, 571, 703, 757, 804, length: 10),
                                    .init(name: "Washington", areaCodes: 206, 253, 360, 425, 509, 564, length: 10),
                                    .init(name: "Washington, DC", areaCodes: 202, length: 10),
                                    .init(name: "West Virginia", areaCodes: 304, 681, length: 10),
                                    .init(name: "Wisconsin", areaCodes: 262, 414, 534, 608, 715, 920, length: 10),
                                    .init(name: "Wyoming", areaCodes: 307, length: 10)
                                   ])
    
    static let virginIslands = Self(code: "1", destinations: [.init(areaCodes: 340, length: 10)])
}
