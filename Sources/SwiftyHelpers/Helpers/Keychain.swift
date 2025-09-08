//
//  Keychain.swift
//  SwiftyHelpers
//
//  Created by Sliman Desmars on 05/09/2025.
//

import Foundation

public enum KeychainError: Error, CustomStringConvertible {
    case unexpectedStatus(OSStatus)

    public var description: String {
        switch self {
            case .unexpectedStatus(let status):
                if let message = SecCopyErrorMessageString(status, nil) as String? { return message }
            
                else { return "Keychain error with status code: \(status)" }
        }
    }
}

//  Helper to manage adding, updating, and removing elements in the keychain.
public enum Keychain {
    
    /// Method for inserting or updating elements in the keychain.
    /// 
    /// - Parameters:
    ///   - key: String used as key for identification purposes inside the keychain identification inside the keychain.
    ///   - data: Data to be stored in the keychain.
    ///   - service: String that represents the isolation of a key between features, modules, and applications.
    ///   - accessibility: String to adjust the security level.
    ///   - enableICloudSync: Bool to activate the synchronization with iCloud.
    ///
    /// - Important: This method will attempt to update the element first. If the element does not exist, it will be added.
    ///
    ///  - Author: Desmars Sliman
    ///
    @available(macOS 10.10, iOS 13.0, watchOS 2.0, tvOS 9.0, *)
    static func store(for key: String, _ data: Data, service: String = Bundle.main.bundleIdentifier ?? "app", accessibility: CFString = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, enableICloudSync: Bool = false) throws {
        
        let baseQuery: [String: Any] = [
            kSecClass               as String: kSecClassGenericPassword,
            kSecAttrService         as String: service,
            kSecAttrAccount         as String: key
        ]

        var attributes: [String: Any] = [
            kSecValueData           as String: data,
            kSecAttrAccessible      as String: accessibility
        ]
        
        attributes[kSecAttrSynchronizable as String] = enableICloudSync ? kCFBooleanTrue as Any : kCFBooleanFalse as Any

        var status: OSStatus = SecItemUpdate(baseQuery as CFDictionary, attributes as CFDictionary)

        if status == errSecItemNotFound {
            var addQuery = baseQuery
            addQuery.merge(attributes) { _, new in new }
            status = SecItemAdd(addQuery as CFDictionary, nil)
        }

        guard status == errSecSuccess else { throw KeychainError.unexpectedStatus(status) }
    }
    
    
    /// Method for retrieving elements from the keychain.
    ///
    /// - Parameters:
    ///   - key: String used as key for identification purposes inside the keychain identification inside the keychain.
    ///   - service: String that represents the isolation of a key between features, modules, and applications.
    ///   - enableICloudSync: Bool to activate the synchronization with iCloud (nil => ANY).
    ///
    /// - Important: by default for the iCloud sync the attribut check if it's nil  and after that boolean verification is done.
    ///
    /// - Returns: Data stored in the keychain or nil the object doesn't exist.
    ///
    ///  - Author: Desmars Sliman
    ///
    @available(macOS 10.10, iOS 13.0, watchOS 2.0, tvOS 9.0, *)
    static func fetch(for key: String, service: String = Bundle.main.bundleIdentifier ?? "app", enableICloudSync: Bool? = nil) throws -> Data? { // // nil => ANY
        
        var query: [String: Any] = [
            kSecClass               as String: kSecClassGenericPassword,
            kSecAttrService         as String: service,
            kSecAttrAccount         as String: key,
            kSecReturnData          as String: kCFBooleanTrue as Any,
            kSecMatchLimit          as String: kSecMatchLimitOne
        ]

        if let sync = enableICloudSync { query[kSecAttrSynchronizable as String] = sync ? kCFBooleanTrue as Any : kCFBooleanFalse as Any }
        
        else { query[kSecAttrSynchronizable as String] = kSecAttrSynchronizableAny }

        var result: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        if status == errSecItemNotFound { return nil }
        
        guard status == errSecSuccess, let data = result as? Data else { throw KeychainError.unexpectedStatus(status) }
        
        return data
    }
    
    /// Method for removing elements from the keychain.
    ///
    /// - Parameters:
    ///   - key: String used as key for identification purposes inside the keychain identification inside the keychain.
    ///   - service: String that represents the isolation of a key between features, modules, and applications.
    ///   - enableICloudSync: Bool to activate the synchronization with iCloud.
    ///
    /// - Important: remove all items  (synchronizables and not synchronizables )
    ///
    ///  - Author: Desmars Sliman
    ///
    @available(macOS 10.10, iOS 13.0, watchOS 2.0, tvOS 9.0, *)
    static func remove(for key: String, service: String = Bundle.main.bundleIdentifier ?? "app") throws {
        let query: [String: Any] = [
            kSecClass               as String: kSecClassGenericPassword,
            kSecAttrService         as String: service,
            kSecAttrAccount         as String: key,
            kSecAttrSynchronizable  as String: kSecAttrSynchronizableAny
        ]

        let status: OSStatus = SecItemDelete(query as CFDictionary)
        
        guard status == errSecSuccess || status == errSecItemNotFound else { throw KeychainError.unexpectedStatus(status) }
    }
}
