//
//  CatalogCoordinator.swift
//  LintSchool
//
//  Created by Elgendy on 1.05.2020.
//  Copyright © 2020 Elgendy. All rights reserved.
//

import Common
import Catalog

public class CatalogCoordinator: CatalogCoordinatorProtocol {
        
    public var parentCoordinator: Coordinator?
    public var childCoordinators = [Coordinator]()
    
    public var router: RouterProtocol
    
    public init(router: RouterProtocol) {
        self.router = router
    }
    
    public func start() {
        let viewController = CatalogViewController()
        viewController.coordinator = self
        router.push(viewController) { [weak self] in
            self?.parentCoordinator?.childDidFinish(self)
        }
    }
    
    public func routeToCourse(courseName: String) {
        let coordinator = CourseCoordinator(router: router,
                                            courseName: courseName)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
}
