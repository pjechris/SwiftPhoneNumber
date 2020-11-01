//
//  ViewController.swift
//  SwiftPhoneNumberExample
//
//  Created by JC on 13/10/2020.
//

import UIKit
import SwiftPhoneNumber
import SwiftPhoneNumber_UIKit

class ViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    
    let country = PhoneCountry(code: "+33",
                               nationalCode: "0",
                               destinations: [
                                .init(type: .fixed, areaCodes: 1...3, length: 9),
                                .init(type: .mobile, areaCodes: 6...6, length: 9)
                               ]
    )
    
    let textFormatter = NumberFormatter(
        international: [.internationalCode, .subscriber(1), .separator(" "), .group(subscriberBy: 2, separator: " ")],
        national: [.prefixCode, .subscriber(1), .separator(" "), .group(subscriberBy: 2, separator: " ")]
    )
    
    lazy var formatter = TextFieldFormatter<NumberInputFormatter>(
        formatter: NumberInputFormatter(
            countriesFormatter: [country: textFormatter]
        )
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = formatter
    }
}

