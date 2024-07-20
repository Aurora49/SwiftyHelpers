//
//  String+isValidEmailUnitTests.swift.swift
//  
//
//  Created by Sliman Desmars on 05/07/2024.
//

import XCTest

@testable import SwiftyHelpers

final class String_isValidEmailUnitTests: XCTestCase {

    func testEmailWithACorrectFormat() {
        
        do {
            let emailTest: String = "name@domain.com"
            _ = try emailTest.isValidEmail()
            
        } catch { XCTFail("It's a valid format an error should not be received !") }
    }
        
    func testEmailWithAnInCorrectFormat() {

        do {
            let emailTest: String = "name@dom;ain.com"
            
            _ = try emailTest.isValidEmail()
        } catch let errorReceived {
            if let error = errorReceived as? TextfieldsError {
                XCTAssert((error == TextfieldsError.invalidEmailFormat))
            }
        }
    }
}
