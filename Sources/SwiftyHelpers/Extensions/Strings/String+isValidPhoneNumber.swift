//
//  File.swift
//  
//
//  Created by Sliman Desmars on 28/06/2024.
//

import Foundation

extension String {
    
    public func isValidPhoneNumber(rule: NSPredicate = NSPredicate(format:"SELF MATCHES %@", "^(?:\\+|00)(?:[0-9]){6,14}[0-9]$")) throws -> Bool {
            
        if rule.evaluate(with: self) == false { throw TextfieldsError.invalidPhoneNumberFormat }
        
        else { return true }
    }
}
