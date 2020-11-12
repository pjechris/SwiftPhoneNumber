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
    
    let country = PhoneCountry(code: "33",
                               nationalCode: "0",
                               destinations: [
                                .init(type: .fixed, areaCodes: 1...3, length: 9),
                                .init(type: .mobile, areaCodes: 6...6, length: 9)
                               ]
    )
    
    let textFormatter = PhoneNumberFormatter("\(.code)\(1) \(2) \(2) \(2) \(2)")
    
    lazy var formatter = TextFieldFormatter<PhoneNumberInputFormatter>(
        formatter: PhoneNumberInputFormatter(
            countriesFormatter: [country: textFormatter]
        )
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = formatter
    }
}

