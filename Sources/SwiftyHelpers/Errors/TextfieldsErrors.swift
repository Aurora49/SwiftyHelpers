//
//  File.swift
//  
//
//  Created by Sliman Desmars on 28/06/2024.
//

import Foundation

/// Enum to manage all errors related to the planning page
public enum TextfieldsError: Error {
    
    // @MARK: Errors
    case invalidEmailFormat // TE001
    
    case invalidPhoneNumberFormat // TE002
    
    // @MARK: Errors title
    
    /// Error translated in Onesky to display in the pop up explaining what happen and what is the reason.
    var errorTitle: String {

        switch self {
            case .invalidEmailFormat: return "textfield.error.title.te001".translate()
            case .invalidPhoneNumberFormat: return "textfield.error.title.te002".translate()
        }
    }
    
    // @MARK: Errors description
    
    /// Error translated.
    var errorDescription: String {

        switch self {
        case .invalidEmailFormat: return "textfield.error.te001".translate()
        case .invalidPhoneNumberFormat: return "textfield.error.te002".translate()
        }
    }
    
    // @MARK: Errors Code
    /// Code received to match with this error.
    var errorCode: String {
        
        switch self {
            case .invalidEmailFormat: return "TE001"
            case .invalidPhoneNumberFormat: return "TE002"
        }
    }
}
