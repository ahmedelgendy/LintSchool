//
//  Config.swift
//  LintSchool
//
//  Created by Elgendy on 1.05.2020.
//  Copyright © 2020 Elgendy. All rights reserved.
//

import Foundation
import Analytics

struct Config { }

// MARK:- AnalyticsConfig
extension Config: AnalyticsConfig {
    static var analyticsKey: String {
        #if DEBUG
        return "tfghjnkmffdcgvhbjnkm"
        #endif
    }
    static var appVersion: String {
        return "1.1"
    }
}

