import Foundation

/// Format a text typed by user by using its representing `Value`
public protocol InputFormatter {
    associatedtype Value
 
    /// Clean text from all unecessary characters
    /// - Returns: string with no formatting characters
    func unformatting(text: String) -> String
    
    /// Convert (unformatted) text into an associated object. Example: a IBAN, a PhoneNumber, a Date, ...
    /// - Returns: An object representing the unformatted text or an error if text can't be converted
    func convert(unformatted: String) throws -> Value
    
    /// Format text using its associated value or nil if no transform can be made
    /// - Returns: formatted string of value or nil. If nil consumer should assume that the initial formatted text should
    /// be used
    /// - Parameter unformatted: unformatted text representation of value
    func formatting(unformatted: String, value: Result<Value, Error>) -> String?
}

