import Foundation

/// Provide api to format <-> unformat text typed by user
public protocol TextFormatter {
    associatedtype Value
 
    /// - Returns: string with no formatting characters
    static func unformatted(text: String) -> String
    
    /// - Returns: formatted string of value
    /// - Parameter unformatted: unformatted text representation of value based on user input
    static func formatted(unformatted: String, value: Value) -> String
    
    /// - Returns: A strongly typed object associated to the unformatted value or an error if value can't be converted
    static func convert(unformatted: String) throws -> Value
}

