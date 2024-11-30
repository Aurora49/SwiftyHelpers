//
//  File.swift
//  
//
//  Created by Sliman Desmars on 28/06/2024.
//

import Foundation

/// Enum to manage all errors related to the planning page
public enum StringFormatErrors: Error {
    
    // @MARK: Errors
    case invalidEmailFormat
    
    case invalidPhoneNumberFormat
    
    // @MARK: Errors description
    /// Error translated.
    var errorDescriptionTranslated: String {

        switch self {
            case .invalidEmailFormat: return "string.error.format.invalidEmailFormat".translate()
            case .invalidPhoneNumberFormat: return "string.error.format.invalidPhoneNumberFormat".translate()
        }
    }
    
    // @MARK: Errors description
    /// Untranslated error (if user wants to use own translation)
    var errorDescriptionNotTranslated: String {

        switch self {
            case .invalidEmailFormat: return "string.error.format.invalidEmailFormat"
            case .invalidPhoneNumberFormat: return "string.error.format.invalidPhoneNumberFormat"
        }
    }
    
    // @MARK: Errors Code
    /// Receive code in accordance with the error.
    var errorCode: String {
        
        switch self {
            case .invalidEmailFormat: return "SFE001"
            case .invalidPhoneNumberFormat: return "SFE002"
        }
    }
}
