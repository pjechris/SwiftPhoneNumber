import XCTest
import Foundation
import UIKit
@testable import SwiftPhoneNumber

class TextInputFormatterTests: XCTestCase {
    var textField: UITextField!
    var formatter: TextInputFormatter<FormatterStub>!
    
    override func setUp() {
        textField = UITextField()
        formatter = .init()
        FormatterStub.convertStubResult = .success(())
    }

    func test__shouldChangeCharacters__addText__itFormatText() {
        let textToAdd = "02030405"
        
        textField.text = "01"
        formatter.textField(textField,
                            shouldChangeCharactersIn: NSRange(location: textField.text!.count, length: 0),
                            replacementString: textToAdd)
        
        XCTAssertEqual(textField.text, "01 02 03 04 05")
    }
    
    func test__shouldChangeCharacters__addText__itUpdateCursorPosition() {
        let textToAddAfter03 = "04"
        let text = "01020305"
        let insertionIndex = text.index(of: "3")! + 1
        
        textField.text = text
        formatter.textField(textField,
                            shouldChangeCharactersIn: NSRange(location: insertionIndex, length: 0),
                            replacementString: textToAddAfter03)
        
        XCTAssertEqual(textField.text, "01 02 03 04 05")
    }
    
    func test__shouldChangeCharacters__addText__convertThrows__itFormatText() {
        let textToAdd = "0203"
        
        FormatterStub.convertStubResult = .failure(NSError(domain: "", code: 0))
        
        textField.text = "01"
        formatter.textField(textField,
                            shouldChangeCharactersIn: NSRange(location: textField.text!.count, length: 0),
                            replacementString: textToAdd)
        
        XCTAssertEqual(textField.text, "01 02 03")
    }
        
    func test__shouldChangeCharacters__deleteText__convertThrows__itDontFormatText() {
        let text = "01 02 03"
        let deleteRange = NSRange(location: text.index(of: "2")!, length: 0)
        
        FormatterStub.convertStubResult = .failure(NSError(domain: "", code: 0))
        
        textField.text = "01 02 03"
        
        formatter.textField(textField, shouldChangeCharactersIn: deleteRange, replacementString: "")
        
        XCTAssertEqual(textField.text, "01 0 03")
    }
}

extension TextInputFormatterTests {
    struct FormatterStub: TextFormatter {
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
}

extension String {
    func index(of character: Character) -> Int? {
        firstIndex(of: character).map { distance(from: startIndex, to: $0) }
    }
}
