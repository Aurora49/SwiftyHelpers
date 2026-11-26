//
//  String+validateEmailUnitTests.swift
//
//
//  Created by Sliman Desmars on 05/07/2024.
//

import XCTest

@testable import SwiftyHelpers

final class StringValidateEmailUnitTests: XCTestCase {

    func testEmailWithACorrectFormat() {

        let validEmails = [
            "name@domain.com", "first.last+tag@gmail.com", "a-b@x.fr",
            "a@b.info", "Name@Domain.COM", "a@sub.domain.co.uk"
        ]

        for email in validEmails {
            XCTAssertNoThrow(try email.validateEmail(), email)
        }
    }

    func testEmailWithAnInCorrectFormat() {

        let invalidEmails = [
            "name@dom;ain.com", "name", "name@domain", "@domain.com", "name@.com", "name@domain.c",
            "", " ", " name@domain.com", "name@domain.com ", "name@domain.com\n", "na me@domain.com"
        ]

        for email in invalidEmails {
            XCTAssertThrowsError(try email.validateEmail(), email) { error in
                XCTAssertEqual(error as? StringFormatErrors, .invalidEmailFormat)
            }
        }
    }

    func testCustomRuleReplacesTheDefaultOne() {

        let onlyCompanyEmails = NSPredicate(format: "SELF ENDSWITH %@", "@company.com")

        XCTAssertNoThrow(try "name@company.com".validateEmail(rule: onlyCompanyEmails))
        XCTAssertThrowsError(try "name@domain.com".validateEmail(rule: onlyCompanyEmails)) { error in
            XCTAssertEqual(error as? StringFormatErrors, .invalidEmailFormat)
        }
    }

    func testErrorIsTranslated() {

        XCTAssertEqual(StringFormatErrors.invalidEmailFormat.localizedDescription, "Invalid email format!")
    }
}
