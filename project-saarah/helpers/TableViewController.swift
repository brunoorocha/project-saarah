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
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ButtonTableViewCell else {
            return UITableViewCell()
        }

        cell.selectionStyle = .none
//        cell.setupNumericLabelsWith(
//            amountText: "8 Kg",
//            validityText: "01/10/2020",
//            priceText: "R$ 120,00",
//            addedOnDayText: "01/10/2019"
//        )

        return cell
    }
}
