//
//  StringFormatErrorsUnitTests.swift
//  SwiftyHelpers
//

import XCTest

@testable import SwiftyHelpers

final class StringFormatErrorsUnitTests: XCTestCase {

    func testErrorCodes() {

        XCTAssertEqual(StringFormatErrors.invalidEmailFormat.errorCode, "SFE001")
        XCTAssertEqual(StringFormatErrors.invalidPhoneNumberFormat.errorCode, "SFE002")
    }

    func testUntranslatedDescriptionsAreTheTranslationKeys() {

        XCTAssertEqual(
            StringFormatErrors.invalidEmailFormat.errorDescriptionNotTranslated,
            "string.error.format.invalidEmailFormat"
        )
        XCTAssertEqual(
            StringFormatErrors.invalidPhoneNumberFormat.errorDescriptionNotTranslated,
            "string.error.format.invalidPhoneNumberFormat"
        )
    }

    func testTranslatedDescriptions() {

        XCTAssertEqual(StringFormatErrors.invalidEmailFormat.errorDescriptionTranslated, "Invalid email format!")
        XCTAssertEqual(
            StringFormatErrors.invalidPhoneNumberFormat.errorDescriptionTranslated,
            "Invalid phone number format!"
        )
    }
}
