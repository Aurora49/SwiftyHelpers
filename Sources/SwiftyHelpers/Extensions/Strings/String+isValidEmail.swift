//
//  File.swift
//  
//
//  Created by Sliman Desmars on 28/06/2024.
//

import Foundation

extension String {
    
    public func isValidEmail(rule: NSPredicate = NSPredicate(format:"SELF MATCHES %@", "^\\w+[\\w-\\.]*\\@\\w+[\\w-\\.]*\\w+\\.[a-z]{2,3}$")) throws -> Bool {
            
        if rule.evaluate(with: self) == false { throw TextfieldsError.invalidEmailFormat }
            
        else { return true }
    }
}
