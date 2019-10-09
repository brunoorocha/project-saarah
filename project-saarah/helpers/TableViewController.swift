//
//  TableViewController.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "MENU"

        tableView.backgroundColor = .gray
        tableView.separatorStyle = .none
        tableView.register(PickerFieldTableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PickerFieldTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
}
