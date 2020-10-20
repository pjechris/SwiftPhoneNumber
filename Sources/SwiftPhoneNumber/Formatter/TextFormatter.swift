import Foundation

/// Format a text typed by user by using its representing `Value`
public protocol TextFormatter {
    associatedtype Value
 
    /// - Returns: string with no formatting characters
    static func unformatted(text: String) -> String
    
    /// - Returns: formatted string of value
    /// - Parameter unformatted: unformatted text representation of value
    static func formatted(unformatted: String, value: Result<Value, Error>) -> String
    
    /// - Returns: An object representing the unformatted text or an error if text can't be converted
    static func convert(unformatted: String) throws -> Value
}

