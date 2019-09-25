//
//  HomeViewController.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppStyleGuide.Colors.background.uiColor
        configureTableView()
    }
    
    func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProductActivityTableViewCell(style: .default, reuseIdentifier: "ProductActivityTableViewCell")
        cell.dateLabel.text = "01/01/2019"
        cell.label.text = "Adicionados 5 kg de mussarela"
        return cell
    }
}
