//
//  KeychainUnitTests.swift
//  SwiftyHelpers
//
//  Created by Sliman Desmars on 05/09/2025.
//

import Foundation
import Testing

@testable import SwiftyHelpers

@Suite("Keychain helper unit tests")
struct KeychainTests {

    // Method used to generate a unique service name, to prevent any issue during testing.
    private func createUniqueService() -> String { return "com.example.KeychainTests.\(UUID().uuidString)" }

    private let keyA: String = "test.key.A"
    private let keyB: String = "test.key.B"

    // MARK: - Store / Load

    @Test("Add data and then fetch and check the data")
    func addAndFetchValue() throws {
        
        let service: String = self.createUniqueService()
        
        let dataSample: Data = Data("hello".utf8)

        do {
            try Keychain.store(for: keyA, dataSample)
            
            if let result: Data =  try Keychain.fetch(for: keyA){
                #expect(result == dataSample)
                try? Keychain.remove(for: keyA, service: service)
            }
            else {
                let error: OSStatus = errSecItemNotFound
                throw KeychainError.unexpectedStatus(error)
            }
        }
        catch let errorReceived { throw errorReceived }
    }

    @Test("Update existing data and then fetch and check the data")
    func updateAndFetchValue() throws {
        
        let service: String = self.createUniqueService()
        
        let dataSample: Data = Data("hello".utf8)
        
        let dataUpdated: Data = Data("hello".utf8)

        do {
            try Keychain.remove(for: keyA, service: service)
            
            try Keychain.store(for: keyA, dataSample)
            
            try Keychain.store(for: keyA, dataUpdated)
            
            if let result: Data =  try Keychain.fetch(for: keyA){
                #expect(result == dataUpdated)
                try Keychain.remove(for: keyA, service: service)
            }
            else {
                let error: OSStatus = errSecItemNotFound
                throw KeychainError.unexpectedStatus(error)
            }
        }
        catch let errorReceived { throw errorReceived }
    }
    
    @Test("Remove existing data and then check if the the data has been removed correctly.")
    func removeAndFetchValue() throws {
        
        let service: String = self.createUniqueService()
        
        let dataSample: Data = Data("hello".utf8)
        
        do {
            try Keychain.store(for: keyB, dataSample, service: service)
            
            try Keychain.remove(for: keyB, service: service)
            
            let result = try Keychain.fetch(for: keyB, service: service, enableICloudSync: nil)
            
            #expect(result == nil)
        }
        catch let errorReceived { throw errorReceived }
    }
}
