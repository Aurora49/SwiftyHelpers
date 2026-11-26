//
//  Predicates.swift
//  SwiftyHelpers
//
//  Created by Sliman Desmars on 28/06/2024.
//

import Foundation

extension DefaultValues {

    public enum Predicates {

        case emailFormat

        case phoneNumberFormat

        public var value: NSPredicate {
            switch self {
            case .emailFormat: return Self.email
            case .phoneNumberFormat: return Self.phoneNumber
            }
        }

        // Built once and reused: compiling the regex at each call is costly.
        private static let email = NSPredicate(
            format: "SELF MATCHES %@",
            "^[A-Za-z0-9._%+-]+@(?:[A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$"
        )

        private static let phoneNumber = NSPredicate(format: "SELF MATCHES %@", "^(?:\\+|00)(?:[0-9]){6,14}[0-9]$")
    }
}
