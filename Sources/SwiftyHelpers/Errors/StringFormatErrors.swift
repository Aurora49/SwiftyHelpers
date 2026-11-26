//
//  StringFormatErrors.swift
//  SwiftyHelpers
//
//  Created by Sliman Desmars on 28/06/2024.
//

import Foundation

/// Errors thrown by the string format validations.
public enum StringFormatErrors: LocalizedError {

    // MARK: - Errors
    case invalidEmailFormat

    case invalidPhoneNumberFormat

    // MARK: - Errors description
    /// Error translated.
    public var errorDescriptionTranslated: String {

        switch self {
        case .invalidEmailFormat: return "string.error.format.invalidEmailFormat".translate()
        case .invalidPhoneNumberFormat: return "string.error.format.invalidPhoneNumberFormat".translate()
        }
    }

    // MARK: - Errors description
    /// Untranslated error (if user wants to use own translation)
    public var errorDescriptionNotTranslated: String {

        switch self {
        case .invalidEmailFormat: return "string.error.format.invalidEmailFormat"
        case .invalidPhoneNumberFormat: return "string.error.format.invalidPhoneNumberFormat"
        }
    }

    // MARK: - Errors Code
    /// Receive code in accordance with the error.
    public var errorCode: String {

        switch self {
        case .invalidEmailFormat: return "SFE001"
        case .invalidPhoneNumberFormat: return "SFE002"
        }
    }

    // MARK: - LocalizedError
    /// Translated description, used by `localizedDescription`.
    public var errorDescription: String? { errorDescriptionTranslated }
}
