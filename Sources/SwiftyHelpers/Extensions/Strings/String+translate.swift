//
//  File.swift
//  
//
//  Created by Sliman Desmars on 07/07/2024.
//

import Foundation

extension String {
    
    public func translate() -> String {
        
        if #unavailable(macOS 12) { return NSLocalizedString(self, comment:"") }
        
        else { return String(localized: "\(self)") }
    }
}
