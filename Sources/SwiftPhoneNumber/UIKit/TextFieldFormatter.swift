import Foundation
import UIKit

/// Provide formatting functionalities to `UITextField` typed text.
public class TextFieldFormatter<Formatter: TextFormatter>: NSObject, UITextFieldDelegate {
    public private(set) var value: Formatter.Value?
    
    /// Be careful: this method has side effects such as:
    /// - updating `value` attribute
    /// - updating `textField.text` content and cursor position
    @discardableResult
    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString replacementText: String) -> Bool {
        
        let cursorPosition = range.location + replacementText.count
        let isDeleting = replacementText.isEmpty
        var text = textField.text ?? ""
        
        text = Formatter.unformatted(
            text: text.replacingCharacters(in: Range(range, in: text)!, with: replacementText)
        )
        
        do {
            value = try Formatter.convert(unformatted: text)
        }
        catch {
            value = nil
            return isDeleting
        }

        let formattedText = Formatter.formatted(unformatted: text, value: value!)

        if formattedText != textField.text {
            textField.update(newText: formattedText,
                             lastCursor: (character: replacementText.last!, position: cursorPosition))
        }

        return false
    }
}

extension UITextField {
    func update(newText: String,
                lastCursor: (character: Character, position: Int)) {
        
        text = newText
        selectedTextRange = textRange(for: relocalizedPosition(of: lastCursor))

        sendActions(for: .editingChanged)
    }
    
    /// - Returns: Try to find new cursor position based on its last known position and character
    private func relocalizedPosition(of cursor: (character: Character, position: Int)) -> Int {
        // case insensitive comparison
        let character = Character(cursor.character.lowercased())

        guard let text = self.text?.lowercased() else {
            return 0
        }

        if cursor.position >= text.count {
            return text.count
        }

        if text[cursor.position - 1] == character {
            return cursor.position
        }

        let substring = text[cursor.position...]

        // might not be found if character is not part of the string anymore
        guard let index = substring.firstIndex(of: character) else {
            return cursor.position
        }

        return cursor.position + text.distance(from: substring.startIndex, to: index) + 1
    }

    private func textRange(for offset: Int) -> UITextRange? {
        guard let textPosition = position(from: beginningOfDocument, offset: offset) else {
            return nil
        }

        return textRange(from: textPosition, to: textPosition)
    }
}

extension String {
    subscript(offset: Int) -> Character {
        return self[index(startIndex, offsetBy: offset)]
    }

    subscript(range: PartialRangeFrom<Int>) -> Substring {
        return self[index(startIndex, offsetBy: range.lowerBound)...]
    }
}
