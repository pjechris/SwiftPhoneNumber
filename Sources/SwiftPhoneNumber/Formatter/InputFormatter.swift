import Foundation

/// Format a text typed by user by using its representing `Value`
public protocol InputFormatter {
    associatedtype Value
 
    /// - Returns: string with no formatting characters
    func unformatted(text: String) -> String
    
    /// - Returns: formatted string of value
    /// - Parameter unformatted: unformatted text representation of value
    func formatted(unformatted: String, value: Result<Value, Error>) -> String?
    
    /// - Returns: An object representing the unformatted text or an error if text can't be converted
    func convert(unformatted: String) throws -> Value
}

