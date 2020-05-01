//
//  CatalogCoordinator.swift
//  Catalog
//
//  Created by Elgendy on 1.05.2020.
//  Copyright © 2020 Elgendy. All rights reserved.
//

import Foundation
import Common

public protocol CatalogCoordinatorProtocol: Coordinator {
    func routeToCourse(courseName: String)
}
