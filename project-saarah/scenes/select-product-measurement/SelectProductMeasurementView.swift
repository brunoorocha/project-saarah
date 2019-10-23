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
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.barTintColor = .white
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
        addSubview(navigationBar)
        addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationBar.topAnchor.constraint(equalTo: topAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
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
