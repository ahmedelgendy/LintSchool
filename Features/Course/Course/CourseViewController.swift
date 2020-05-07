//
//  CourseViewController.swift
//  Catalog
//
//  Created by Elgendy on 1.05.2020.
//  Copyright © 2020 Elgendy. All rights reserved.
//

import UIKit
import Common

public protocol CourseCoordinatorProtocol: Coordinator {}

public class CourseViewController: UIViewController {

    public weak var coordinator: CourseCoordinatorProtocol?
        
    public init() {
        super.init(nibName: "CourseViewController", bundle: Bundle(identifier: "dev.elgendy.Course"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }

}
