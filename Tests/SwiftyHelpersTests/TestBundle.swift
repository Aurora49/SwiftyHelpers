//
//  TestBundle.swift
//  SwiftyHelpers
//

import Foundation

/// Builds a throwaway bundle on disk, to test code that reads `Info.plist` or translations.
enum TestBundle {

    /// - Parameters:
    ///   - infoPlist: Content of the bundle's `Info.plist`.
    ///   - englishStrings: Content of `en.lproj/Localizable.strings`, if any.
    static func make(infoPlist: [String: String] = [:], englishStrings: [String: String]? = nil) throws -> Bundle {

        // A unique path each time: `Bundle` caches instances by path.
        let root = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString)
            .appendingPathExtension("bundle")

        #if os(macOS)
        let contents = root.appendingPathComponent("Contents")
        let resources = contents.appendingPathComponent("Resources")
        #else
        let contents = root
        let resources = root
        #endif

        try FileManager.default.createDirectory(at: contents, withIntermediateDirectories: true)
        try write(["CFBundleIdentifier": "test.\(UUID().uuidString)"].merging(infoPlist) { $1 },
                  to: contents.appendingPathComponent("Info.plist"))

        if let englishStrings {
            let lproj = resources.appendingPathComponent("en.lproj")
            try FileManager.default.createDirectory(at: lproj, withIntermediateDirectories: true)
            try write(englishStrings, to: lproj.appendingPathComponent("Localizable.strings"))
        }

        guard let bundle = Bundle(url: root) else { throw CocoaError(.fileReadCorruptFile) }
        return bundle
    }

    private static func write(_ dictionary: [String: String], to url: URL) throws {

        let data = try PropertyListSerialization.data(fromPropertyList: dictionary, format: .xml, options: 0)
        try data.write(to: url)
    }
}
