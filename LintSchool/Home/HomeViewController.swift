//
//  HomeViewController.swift
//  LintSchool
//
//  Created by Elgendy on 30.04.2020.
//  Copyright © 2020 Elgendy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    weak var coordinator: MainCoordinator?
    
    init() {
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"

        if let url: String = try? Configuration.value(for: "SERVER_URL") {
            print("SERVER_URL: " + url)
        }
        
    }
    

    @IBAction func goToCoursesCatalog(_ sender: Any) {
        coordinator?.routeToCatalog()
    }
    
}

