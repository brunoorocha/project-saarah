//
//  SelectProductMeasurementView.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol SelectProductMeasurementViewDelegate: class {
    func cancelAction()
    func doneAction()
}

class SelectProductMeasurementView: UIView {
    var navigationBar = UINavigationBar()
    var tableView = SaarahTableView()

    weak var delegate: SelectProductMeasurementViewDelegate?

    init() {
        super.init(frame: .zero)

        backgroundColor = UIColor.white

        instantiateViews()
        buildViewsHierarchy()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func cancelButtonAction() {
        delegate?.cancelAction()
    }

    @objc func doneButtonAction() {
        delegate?.doneAction()
    }

    func instantiateViews() {
        let navbarTitleAttributes = [
            NSAttributedString.Key.font: AppStyleGuide.Typography.heading3.uiFont,
            NSAttributedString.Key.foregroundColor: AppStyleGuide.Colors.textColor.uiColor
        ]

        navigationBar.titleTextAttributes = navbarTitleAttributes

        let navigationItem = UINavigationItem(title: "\(Localization(.selectProductMeasurement(.title)))")

        let leftButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonAction))
        let rightButton =  UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))

        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton

        navigationBar.setItems([navigationItem], animated: false)

        tableView.register(SelectableCell.self, forCellReuseIdentifier: "selectableTableViewCell")
    }

    func buildViewsHierarchy() {
        addSubviews([navigationBar, tableView])
    }

    func setupConstraints() {
        navigationBar.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor
        )

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func buildCell(winthIndexPath indexPath: IndexPath, andName name: String, isSelected selected: Bool) -> UITableViewCell {
        let cell = SelectableCell()
        cell.roundCellIfNeeded(index: indexPath.row, numberOfCells: tableView.numberOfRows(inSection: indexPath.section))
        cell.label.text = name
        if selected {
            cell.isChecked = true
        }

        return cell
    }
}
