//
//  File.swift
//  
//
//  Created by Sliman Desmars on 28/06/2024.
//

import Foundation

public enum Predicate {
    
    case emailFormat
    
    case phoneNumberFormat
    
    var value: NSPredicate {
        switch self {
            case .emailFormat: return NSPredicate(format:"SELF MATCHES %@", "^\\w+[\\w-\\.]*\\@\\w+[\\w-\\.]*\\w+\\.[a-z]{2,3}$")
            case .phoneNumberFormat: return NSPredicate(format:"SELF MATCHES %@", "^(?:\\+|00)(?:[0-9]){6,14}[0-9]$")
        }
    }
}
