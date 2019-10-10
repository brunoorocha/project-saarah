//
//  ListInventoryView.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ListInventoryView: UIView {

    let tableView = UITableView()

    init() {
        super.init(frame: .zero)

        backgroundColor = .white
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
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "productTableViewCell")
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

    func buildHeaderSection(section: Int, title: String) -> UIView {
        let header = DefaultSectionHeaderView()
        header.titleLabel.text = title.uppercased()
        return header
    }

    func buildCell(indexPath: IndexPath, name: String, quantity: String) -> UITableViewCell {
        let cell = DefaultCellTableViewCell()
        cell.roundCellIfNeeded(index: indexPath.row, numberOfCells: 3)
        cell.label.text = name
        cell.detailLabel.text = quantity

        return cell
    }
}
