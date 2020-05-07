//
//  Configuration.swift
//  LintSchool
//
//  Created by Elgendy on 8.05.2020.
//  Copyright © 2020 Elgendy. All rights reserved.
//

import Foundation

enum Configuration {
    
    enum Error: Swift.Error {
        case missingKey
        case invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}
