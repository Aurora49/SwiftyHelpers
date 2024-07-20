//
//  String+isValidPhoneNumberUnitTests.swift
//  
//
//  Created by Sliman Desmars on 07/07/2024.
//

import XCTest

final class String_isValidPhoneNumberUnitTests: XCTestCase {

    /// Test to check regex used to verify email and phone number format.
    func testPhoneNumberWithCorrectFormat() {
        
        do {
            let correctPhoneNumber: String  = "+33760071779"
            _ = try correctPhoneNumber.isValidPhoneNumber()
            
        } catch _ { XCTFail("It's a valid format an error should not be received !") }
    }
}
