//
//  Bundle+versionUnitTests.swift
//  SwiftyHelpers
//

import XCTest

@testable import SwiftyHelpers

final class BundleVersionUnitTests: XCTestCase {

    func testVersionsAreReadFromInfoPlist() throws {

        let bundle = try TestBundle.make(infoPlist: [
            "CFBundleShortVersionString": "1.2.0",
            "CFBundleVersion": "42"
        ])

        XCTAssertEqual(bundle.appVersion, "1.2.0")
        XCTAssertEqual(bundle.buildVersion, "42")
    }

    func testVersionsAreNilWhenMissing() throws {

        let bundle = try TestBundle.make()

        XCTAssertNil(bundle.appVersion)
        XCTAssertNil(bundle.buildVersion)
    }
}
