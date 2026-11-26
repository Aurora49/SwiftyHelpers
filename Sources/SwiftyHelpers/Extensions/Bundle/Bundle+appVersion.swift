//
//  Bundle+appVersion.swift
//  SwiftyHelpers
//
//  Created by Sliman Desmars on 06/12/2024.
//

import Foundation

extension Bundle {

    /// Return a `String` containing the version number from the xcode project file.
    ///  - Returns : the version number as a string or nil if is no version number has been set.
    ///  - Note : If the value is not in the Xcode project file, Xcode will usually display a pop-up
    ///  when you try to install the application on a device or run it on a simulator.
    ///  - Author: Desmars Sliman
    public var appVersion: String? {

        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
}
