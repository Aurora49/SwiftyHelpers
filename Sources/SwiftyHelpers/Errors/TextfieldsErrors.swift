//
//  File.swift
//  
//
//  Created by Sliman Desmars on 28/06/2024.
//

import Foundation

/// Enum to manage all errors related to the planning page
enum TextfieldsError: Error {
    
    // @MARK: Errors
    case invalidEmailFormat // TE001
    
    case invalidPhoneNumberFormat // TE002
    
    case missingFirstName // TE003
    
    case missingLastName // TE004
    
    case missingEmailCustomer // TE005
    
    case missingPhoneNumber // TE006
    
    case missingPhoneNumberIndicator // TE007
    
    case missingCountrySelected // TE008

    // @MARK: Errors title
    
    /// Error translated in Onesky to display in the pop up explaining what happen and what is the reason.
    var errorTitle: String {

        switch self {
            case .invalidEmailFormat: return "textfield.error.title.te001"
            case .invalidPhoneNumberFormat: return "textfield.error.title.te002"
            case .missingFirstName: return "textfield.error.title.te003"
            case .missingLastName: return "textfield.error.title.te004"
            case .missingEmailCustomer: return "textfield.error.title.te005"
            case .missingPhoneNumber: return "textfield.error.title.te006"
            case .missingPhoneNumberIndicator: return "textfield.error.title.te007"
            case .missingCountrySelected: return "textfield.error.title.te008"
        }
    }
    
    // @MARK: Errors description
    
    /// Error translated in Onesky to display in the pop up explaining what happen and what is the reason.
    var errorDescription: String {

        switch self {
            case .invalidEmailFormat: return "textfield.error.te001"
            case .invalidPhoneNumberFormat: return "textfield.error.te002"
            case .missingFirstName: return "textfield.error.te003"// TE003
            case .missingLastName: return "textfield.error.te004"// TE004
            case .missingEmailCustomer: return "textfield.error.te005"// TE005
            case .missingPhoneNumber: return "textfield.error.te006"// TE006
            case .missingPhoneNumberIndicator: return "textfield.error.te007" // TE007
            case .missingCountrySelected: return "textfield.error.te008" // TE008
        }
    }
    
    // @MARK: Errors Code
    /// HTTP code received to match with this error.
    var errorCode: String {
        
        switch self {
            case .invalidEmailFormat: return "TE001"
            case .invalidPhoneNumberFormat: return "TE002"
            case .missingFirstName: return "TE003"
            case .missingLastName: return "TE004"
            case .missingEmailCustomer: return "TE005"
            case .missingPhoneNumber: return "TE006"
            case .missingPhoneNumberIndicator: return "TE007"
            case .missingCountrySelected: return "TE008"
        }
    }
}
