//
//  String+isValidEmailUnitTests.swift.swift
//  
//
//  Created by Sliman Desmars on 05/07/2024.
//

import Foundation
import Testing

@testable import SwiftyHelpers

@Suite("Email validator unit tests")
struct StringIsValidEmailTests {
    
    @Test("A correct email with the right format.")
    func emailWithCorrectFormat() throws {
        let correctEmailFormat: String = "name@domain.com"
        
        _ = try correctEmailFormat.isValidEmail()
    }
    
    @Test("Email with an incorrect format.")
    func emailWithIncorrectFormat() throws {
        let invalidEmailFormat: String = "name@dom;ain.com"
        
        let error = #expect(throws: StringFormatErrors.invalidEmailFormat.self){
            _ = try invalidEmailFormat.isValidEmail()
        }
        #expect(error == .invalidEmailFormat)
    }
}
