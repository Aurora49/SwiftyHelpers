//
//  String+isValidPhoneNumber.swift
//
//  Created by Sliman Desmars on 28/06/2024.
//

import Foundation

extension String {
    
    /// Return a `Bool`  to indicate whether or not the string has a valid format for a phone number.
    /// - Parameter rule: Predicate used to validate the phone number format. If this argument is omitted, this function uses a default predicate.
    /// - Returns: True if the phone number has a valid format.
    /// - Authors: Desmars Sliman
    /// - Important: If the format is invalid, an exception is thrown.
    @available(macOS 10.10, iOS 8.0, watchOS 2.0, tvOS 9.0, *)
    public func isValidPhoneNumber(rule: NSPredicate = DefaultValues.Predicates.phoneNumberFormat.value) throws -> Bool {
            
        if rule.evaluate(with: self) == false { throw StringFormatErrors.invalidPhoneNumberFormat }
        
        else { return true }
    }
}
