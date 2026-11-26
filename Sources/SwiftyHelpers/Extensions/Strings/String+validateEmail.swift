//
//  String+validateEmail.swift
//
//  Created by Sliman Desmars on 28/06/2024.
//

import Foundation

extension String {

    /// Validate that the string has a valid format for an email.
    /// - Parameter rule: Predicate used to validate the email format. If this argument is omitted,
    ///   this function will use a default predicate based on the name@domain.com rule.
    /// - Throws: `StringFormatErrors.invalidEmailFormat` if the format is invalid.
    /// - Author: Desmars Sliman
    public func validateEmail(rule: NSPredicate = DefaultValues.Predicates.emailFormat.value) throws {

        if rule.evaluate(with: self) == false { throw StringFormatErrors.invalidEmailFormat }
    }
}
