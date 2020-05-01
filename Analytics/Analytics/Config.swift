//
//  Config.swift
//  Analytics
//
//  Created by Elgendy on 1.05.2020.
//  Copyright © 2020 Elgendy. All rights reserved.
//

import Foundation

public protocol AnalyticsConfig {
    static var analyticsKey: String { get }
    static var appVersion: String { get }
}

/// Use this method to inject the configuration for this framework.
public func setup(with config: AnalyticsConfig.Type) {
    ConfigType.shared = ConfigType(config)
}

var Config: ConfigType {
    if let config = ConfigType.shared {
        return config
    } else {
        fatalError("Please set the Config for \(Bundle(for: ConfigType.self))")
    }
}

final class ConfigType {
    static fileprivate var shared: ConfigType?

    let analyticsKey: String
    let appVersion: String

    fileprivate init(_ config: AnalyticsConfig.Type) {
        self.analyticsKey = config.analyticsKey
        self.appVersion = config.appVersion
    }
}
