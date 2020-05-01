//
//  CatalogViewController.swift
//  Catalog
//
//  Created by Elgendy on 1.05.2020.
//  Copyright © 2020 Elgendy. All rights reserved.
//

import UIKit
import Common

public class CatalogViewController: UIViewController {

    public weak var coordinator: CatalogCoordinatorProtocol?
    @IBOutlet weak var tableView: UITableView!
    private var courses: [String] = ["iOS Track", "Android Track", "Web Track"]

    public init() {
        super.init(nibName: "CatalogViewController", bundle: Bundle(identifier: "dev.elgendy.Catalog"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func routeToCourse(courseName: String) {
        coordinator?.routeToCourse(courseName: courseName)
    }
    
}

extension CatalogViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        cell.textLabel?.text = courses[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        routeToCourse(courseName: courses[indexPath.row])
    }
    
}
