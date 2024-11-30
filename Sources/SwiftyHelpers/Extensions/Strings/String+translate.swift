//
//  String+translate.swift
//
//
//  Created by Sliman Desmars on 07/07/2024.
//

import Foundation

extension String {
    
    /// Return a version translated of the string.
    /// - Returns: string translated.
    /// - Author: Desmars Sliman
    @available(macOS 10.10, iOS 8.0, watchOS 2.0, tvOS 9.0, *)
    public func translate() -> String {
        
        if #unavailable(macOS 12) { return NSLocalizedString(self, comment:"") }
        
        else { return String(localized: "\(self)") }
    }
}
