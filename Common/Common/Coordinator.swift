//
//  Coordinator.swift
//  Common
//
//  Created by Elgendy on 1.05.2020.
//  Copyright © 2020 Elgendy. All rights reserved.
//

import Foundation

public protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var router: RouterProtocol { get set }
    
    func start()
}

public extension Coordinator {
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated()
            where coordinator === child {
                childCoordinators.remove(at: index)
                break
        }
    }
    
}
