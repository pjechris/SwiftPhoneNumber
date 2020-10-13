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
    
    var formatter = TextFieldFormatter<SampleFormatter>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = formatter
    }
}

struct SampleFormatter: TextFormatter {
    typealias Value = Void
    
    static var convertStubResult: Result<Void, Error> = .success(())
    
    static func unformatted(text: String) -> String {
        text.replacingOccurrences(of: " ", with: "")
    }
    
    static func formatted(unformatted: String, value: Void) -> String {
        unformatted.enumerated().reduce(into: "") { str, iterator in
            str.append((iterator.offset % 2 == 0 && iterator.offset > 0 ? " " : ""))
            str.append(String(iterator.element))
        }
    }
    
    static func convert(unformatted: String) throws -> Void {
        try convertStubResult.get()
    }
}

