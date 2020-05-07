//
//  Coordinator.swift
//  LintSchool
//
//  Created by Elgendy on 1.05.2020.
//  Copyright © 2020 Elgendy. All rights reserved.
//

import Common
//import Catalog

class MainCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var router: RouterProtocol
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        let viewController = HomeViewController()
        viewController.coordinator = self
        router.push(viewController, onNavigateBack: nil)
    }
    
    func routeToCatalog() {
        let coordinator = CatalogCoordinator(router: router)
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
}
