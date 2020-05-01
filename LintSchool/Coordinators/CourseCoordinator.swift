//
//  CourseCoordinator.swift
//  LintSchool
//
//  Created by Elgendy on 1.05.2020.
//  Copyright © 2020 Elgendy. All rights reserved.
//

import Common
import Course

class CourseCoordinator: CourseCoordinatorProtocol {
    
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    
    var router: RouterProtocol
    var courseName: String
    
    init(router: RouterProtocol, courseName: String) {
        self.router = router
        self.courseName = courseName
    }
    
    func start() {
        let viewController = CourseViewController()
        viewController.title = courseName
        viewController.coordinator = self
        router.push(viewController) { [weak self] in
            self?.parentCoordinator?.childDidFinish(self)
        }
    }
    
}
