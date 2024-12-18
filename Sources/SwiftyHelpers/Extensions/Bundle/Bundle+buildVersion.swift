//
//  Bundle+buildVersion.swift
//  SwiftyHelpers
//
//  Created by Sliman Desmars on 18/12/2024.
//

import Foundation

extension Bundle {
    
    /// Return a `String` containing the build version from the xcode project file.
    ///  - Returns : the build number as a string or nil if is no build number has been set.
    ///  - Note : If the value is not in the Xcode project file, Xcode will usually display a pop-up when you try to install the application on a device or run it on a simulator.
    ///  - Author: Desmars Sliman
    @available(iOS 8.0, tvOS 9.0, *)
    public var buildVersion: String? {
        
        if let buildVersionFromXcodeProjectFile: String = self.infoDictionary?["CFBundleVersion"] as? String { return buildVersionFromXcodeProjectFile }
        
        else { return nil }
    }
}
