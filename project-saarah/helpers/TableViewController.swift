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
        tableView.register(LabeledTableViewCell.self, forCellReuseIdentifier: "1Cell")
        tableView.register(ProductItemTableViewCell.self, forCellReuseIdentifier: "2Cell")
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: "3Cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return 120.0
        } else if indexPath.item == 5 {
            return 88.0
        } else {
            return 208.0
        }
//        return 104.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "1Cell", for: indexPath) as? LabeledTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            cell.setupProductNameLabelWith("Presunto")
            
            return cell
        } else if indexPath.item == 5 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "3Cell", for: indexPath) as? ButtonTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "2Cell", for: indexPath) as? ProductItemTableViewCell else {
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            cell.setupNumericLabelsWith(
                amountText: "8 Kg",
                validityText: "01/10/2020",
                priceText: "R$ 80,00",
                addedOnDayText: "01/10/2019"
            )
            
            return cell
        }
    }
}
