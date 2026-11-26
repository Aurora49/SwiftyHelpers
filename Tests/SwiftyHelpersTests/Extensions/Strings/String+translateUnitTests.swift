//
//  String+translateUnitTests.swift
//  SwiftyHelpers
//

import XCTest

@testable import SwiftyHelpers

final class StringTranslateUnitTests: XCTestCase {

    func testKeyIsTranslatedWithThePackageBundleByDefault() {

        XCTAssertEqual("string.error.format.invalidEmailFormat".translate(), "Invalid email format!")
    }

    func testUnknownKeyIsReturnedAsIs() {

        XCTAssertEqual("unknown.key".translate(), "unknown.key")
    }

    func testGivenBundleIsUsedInsteadOfThePackageOne() throws {

        let bundle = try TestBundle.make(englishStrings: [
            "string.error.format.invalidEmailFormat": "Custom email error",
            "app.key": "App value"
        ])

        XCTAssertEqual("string.error.format.invalidEmailFormat".translate(bundle: bundle), "Custom email error")
        XCTAssertEqual("app.key".translate(bundle: bundle), "App value")
        XCTAssertEqual("app.key".translate(), "app.key")
    }
}
