//
//  String+isValidEmail.swift
//
//  Created by Sliman Desmars on 28/06/2024.
//

import Foundation

extension String {
    
    /// Return a `Bool`   to indicate whether or not the string has a valid format for an email.
    /// - Parameter rule: Predicate used to validate the email format. If this argument is omitted, this function will use a default predicate based on the name@domain.com rule.
    /// - Returns: True if the email has a valid format.
    /// - Author: Desmars Sliman
    /// - Important: If the format is invalid, an exception is thrown.
    @available(macOS 10.10, iOS 8.0, watchOS 2.0, tvOS 9.0, *)
    public func isValidEmail(rule: NSPredicate = DefaultValues.Predicates.emailFormat.value) throws -> Bool {
            
        if rule.evaluate(with: self) == false { throw StringFormatErrors.invalidEmailFormat }
            
        else { return true }
    }
}
