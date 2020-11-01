import XCTest
import Foundation
import UIKit
import SwiftPhoneNumber
@testable import SwiftPhoneNumber_UIKit

class TextFieldFormatterTests: XCTestCase {
    var textField: UITextField!
    var formatter: TextFieldFormatter<FormatterStub>!
    var inputFormatterStub: FormatterStub!
    
    override func setUp() {
        textField = UITextField()
        inputFormatterStub = FormatterStub()
        formatter = .init(formatter: inputFormatterStub)
        
        inputFormatterStub.convertStubResult = .success(())
    }

    func test__shouldChangeCharacters__addText__itFormatText() {
        let textToAdd = "02030405"
        
        formatter.changeCharacters(textField: textField,
                                   initialText: "01",
                                   with: textToAdd,
                                   range: NSRange(location: 2, length: 0))
        
        XCTAssertEqual(textField.text, "01 02 03 04 05")
    }
    
    func test__shouldChangeCharacters__addText__itUpdateCursorPosition() {
        let textToAddAfter03 = "04"
        let text = "01020305"
        let insertionIndex = text.index(of: "3")! + 1
        
        formatter.changeCharacters(textField: textField,
                                   initialText: text,
                                   with: textToAddAfter03,
                                   range: NSRange(location: insertionIndex, length: 0))
        
        XCTAssertEqual(textField.text, "01 02 03 04 05")
    }
    
    func test__shouldChangeCharacters__addText__convertThrows__itFormatText() {
        let textToAdd = "0203"
        
        inputFormatterStub.convertStubResult = .failure(NSError(domain: "", code: 0))
        
        formatter.changeCharacters(textField: textField,
                                   initialText: "01",
                                   with: textToAdd,
                                   range: NSRange(location: 2, length: 0))
        
        XCTAssertEqual(textField.text, "01 02 03")
    }
        
    func test__shouldChangeCharacters__deleteText__convertThrows__itDontFormatText() {
        let text = "01 02 03"
        let deleteRange = text.nsRange(of: "2")!
        
        inputFormatterStub.convertStubResult = .failure(NSError(domain: "", code: 0))
        
        formatter.changeCharacters(textField: textField, initialText: text, with: "", range: deleteRange)
        
        XCTAssertEqual(textField.text, "01 0 03")
    }
}

extension TextFieldFormatter {
    func changeCharacters(textField: UITextField, initialText: String, with text: String, range: NSRange) {
        textField.text = initialText
        
        if self.textField(textField, shouldChangeCharactersIn: range, replacementString: text) {
            textField.text = initialText.replacingCharacters(in: Range(range, in: initialText)!, with: text)
        }
    }
}

extension TextFieldFormatterTests {
    struct FormatterStub: InputFormatter {
        typealias Value = Void
        
        var convertStubResult: Result<Void, Error> = .success(())
        
        func unformatted(text: String) -> String {
            text.replacingOccurrences(of: " ", with: "")
        }
        
        func formatted(unformatted: String, value: Result<Void, Error>) -> String? {
            unformatted.enumerated().reduce(into: "") { str, iterator in
                str!.append((iterator.offset % 2 == 0 && iterator.offset > 0 ? " " : ""))
                str!.append(String(iterator.element))
            }
        }
        
        func convert(unformatted: String) throws -> Void {
            try convertStubResult.get()
        }
    }
}

extension String {
    func index(of character: Character) -> Int? {
        firstIndex(of: character).map { distance(from: startIndex, to: $0) }
    }
    
    func nsRange(of character: Character) -> NSRange? {
        index(of: character).map { NSRange(location: $0, length: 1) }
    }
}
