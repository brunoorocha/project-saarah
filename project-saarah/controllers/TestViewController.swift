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
    var cells: [String] = []
    var button = CaptionButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppStyleGuide.Colors.background.uiColor
        configureTableView()
    }

    func configureTableView() {
        view.addSubviews([tableView, button])
        button.setTitle("Add cell", for: .normal)
        button.addTarget(self, action: #selector(didTapOnButton), for: .touchUpInside)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32.0),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32.0)
        ])

        tableView.delegate = self
        tableView.dataSource = self
    }

    @objc func didTapOnButton () {
        cells.append("Item \(cells.count)")
        tableView.reloadData()
//        let indexPath = IndexPath(row: (cells.count - 1), section: 0)
//        tableView.insertRows(at: [indexPath], with: .fade)
    }
}

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = DefaultSectionHeaderView()
        headerView.titleLabel.text = "ATIVIDADE"
        headerView.rightButton.setTitle("VER TODAS", for: .normal)
        return headerView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DefaultCellTableViewCell()
        cell.label.text = cells[indexPath.row]
        cell.roundCellIfNeeded(index: indexPath.row, numberOfCells: cells.count)
        return cell
    }
}
