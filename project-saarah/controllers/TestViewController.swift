//
//  TestViewController.swift
//  project-saarah
//
//  Created by Bruno Rocha on 27/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class TestViewController: SaarahViewController {
    var tableView = SaarahTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Restaurante"
        configureTableView()
    }

    func configureTableView() {
        view.addSubviews([tableView])
    }
}
