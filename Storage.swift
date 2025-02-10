//
//  Storage.swift
//  Storage
//
//  Created by Steven Santeliz on 09/02/25.
//

import Foundation

@propertyWrapper
struct Storage<Value: Codable> {
    private let key: String
    private let defaultValue: Value
    private let container: UserDefaults
    
    init(
        key: String,
        defaultValue: Value,
        container: UserDefaults = .standard
    ) {
        self.key = key
        self.defaultValue = defaultValue
        self.container = container
    }
    
    var wrappedValue: Value {
        get {
            guard let data = container.object(forKey: key) as? Data,
                  let value = try? JSONDecoder().decode(Value.self, from: data)
            else {
                return defaultValue
            }
            return value
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                container.set(data, forKey: key)
            } else {
                container.removeObject(forKey: key)
            }
        }
    }
}

// MARK: - Optional Storage Init

extension Storage where Value: ExpressibleByNilLiteral {
    init(key: String, _ container: UserDefaults = .standard) {
        self.init(key: key, defaultValue: nil, container: container)
    }
}
