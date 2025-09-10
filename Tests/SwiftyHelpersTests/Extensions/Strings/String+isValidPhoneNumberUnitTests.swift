//
//  String+isValidPhoneNumberUnitTests.swift
//  
//
//  Created by Sliman Desmars on 07/07/2024.
//

import Foundation
import Testing

@testable import SwiftyHelpers

@Suite("Phone number validator unit tests")
struct StringIsValidPhoneNumberUnitTests {

    @Test("A correct phone number with the right format.")
    func phoneNumberWithCorrectFormat() throws {
        let correctPhoneNumber: String  = "+33760071779"
        
        _ = try correctPhoneNumber.isValidPhoneNumber()
    }

    @Test("Phone number with an incorrect format.")
    func phoneNumberWithIncorrectFormat() throws {
        let invalidPhoneNumberFormat: String = "+3#3760071779"
        
        let error = #expect(throws: StringFormatErrors.invalidPhoneNumberFormat.self){
            _ = try invalidPhoneNumberFormat.isValidPhoneNumber()
        }
        #expect(error == .invalidPhoneNumberFormat)
    }
}
