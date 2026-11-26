//
//  String+validatePhoneNumberUnitTests.swift
//
//
//  Created by Sliman Desmars on 07/07/2024.
//

import XCTest

@testable import SwiftyHelpers

final class StringValidatePhoneNumberUnitTests: XCTestCase {

    func testPhoneNumberWithCorrectFormat() {

        // The default rule accepts 7 to 15 digits after `+` or `00`.
        let validPhoneNumbers = ["+33600000000", "0033600000000", "+1234567", "+123456789012345", "001234567"]

        for phoneNumber in validPhoneNumbers {
            XCTAssertNoThrow(try phoneNumber.validatePhoneNumber(), phoneNumber)
        }
    }

    func testPhoneNumberWithAnIncorrectFormat() {

        let invalidPhoneNumbers = [
            "0600000000", "+33 6 00 00 00 00", "+33abc",
            "", "+", "+123456", "+1234567890123456", " +33600000000", "+33600000000 ", "+33-600-000-000"
        ]

        for phoneNumber in invalidPhoneNumbers {
            XCTAssertThrowsError(try phoneNumber.validatePhoneNumber(), phoneNumber) { error in
                XCTAssertEqual(error as? StringFormatErrors, .invalidPhoneNumberFormat)
            }
        }
    }

    func testCustomRuleReplacesTheDefaultOne() {

        let frenchMobile = NSPredicate(format: "SELF MATCHES %@", "^0[67][0-9]{8}$")

        XCTAssertNoThrow(try "0600000000".validatePhoneNumber(rule: frenchMobile))
        XCTAssertThrowsError(try "+33600000000".validatePhoneNumber(rule: frenchMobile)) { error in
            XCTAssertEqual(error as? StringFormatErrors, .invalidPhoneNumberFormat)
        }
    }

    func testErrorIsTranslated() {

        XCTAssertEqual(StringFormatErrors.invalidPhoneNumberFormat.localizedDescription, "Invalid phone number format!")
    }
}
