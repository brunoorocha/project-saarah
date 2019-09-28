//
//  TestViewController.swift
//  project-saarah
//
//  Created by Bruno Rocha on 27/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    var tableView = SaarahTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppStyleGuide.Colors.background.uiColor
        configureTableView()
    }

    func configureTableView() {
        view.addSubviews([tableView])

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeMenuTableViewCell()
        return cell
    }
}
