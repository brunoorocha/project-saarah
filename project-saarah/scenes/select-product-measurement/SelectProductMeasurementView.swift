//
//  SelectProductMeasurementView.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SelectProductMeasurementView: UIView {

    let tableView = UITableView()

    init() {
        super.init(frame: .zero)

        backgroundColor = UIColor.white
        tableView.backgroundColor = AppStyleGuide.Colors.background.uiColor

        instantiateViews()
        buildViewsHierarchy()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func instantiateViews() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(SelectableCell.self, forCellReuseIdentifier: "selectableTableViewCell")
    }

    func buildViewsHierarchy() {
        addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func buildCell(indexPath: IndexPath, name: String) -> UITableViewCell {
        let cell = SelectableCell()
        cell.roundCellIfNeeded(index: indexPath.row, numberOfCells: tableView.numberOfRows(inSection: indexPath.section))
        cell.label.text = name

        return cell
    }
}
