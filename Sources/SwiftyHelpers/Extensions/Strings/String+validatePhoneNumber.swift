//
//  String+validatePhoneNumber.swift
//
//  Created by Sliman Desmars on 28/06/2024.
//

import Foundation

extension String {

    /// Validate that the string has a valid format for a phone number.
    ///
    /// The default rule only accepts international numbers without spaces,
    /// starting with `+` or `00` (e.g. `+33600000000`).
    /// - Parameter rule: Predicate used to validate the phone number format.
    ///   If this argument is omitted, this function uses a default predicate.
    /// - Throws: `StringFormatErrors.invalidPhoneNumberFormat` if the format is invalid.
    /// - Authors: Desmars Sliman
    public func validatePhoneNumber(rule: NSPredicate = DefaultValues.Predicates.phoneNumberFormat.value) throws {

        if rule.evaluate(with: self) == false { throw StringFormatErrors.invalidPhoneNumberFormat }
    }
}
