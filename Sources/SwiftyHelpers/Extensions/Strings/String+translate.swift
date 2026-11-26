//
//  String+translate.swift
//
//
//  Created by Sliman Desmars on 07/07/2024.
//

import Foundation

extension String {

    /// Return a version translated of the string.
    /// - Parameter bundle: Bundle containing the translations. If omitted, the SwiftyHelpers bundle is used.
    /// - Returns: string translated.
    /// - Author: Desmars Sliman
    public func translate(bundle: Bundle? = nil) -> String {

        return String(localized: String.LocalizationValue(self), bundle: bundle ?? .module)
    }
}
