//
//  ViewController.swift
//  LintSchool
//
//  Created by Elgendy on 29.04.2020.
//  Copyright © 2020 Elgendy. All rights reserved.
//

import UIKit
import Common

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = Labels.welcome
    }


}

