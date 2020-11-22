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
    
    let delegate = TextFieldPhoneNumberDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = delegate
    }
}

