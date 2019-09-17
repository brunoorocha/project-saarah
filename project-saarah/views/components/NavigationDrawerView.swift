//
//  NavigationDrawerView.swift
//  project-saarah
//
//  Created by Bruno Rocha on 04/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol NavigationDrawerDelegate: class {
    func didSelectOptionAt(index: Int)
}

class NavigationDrawerView: UIView {
    var navigationOptions: [NavigationDrawerMenu] = []
    weak var delegate: NavigationDrawerDelegate?

    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    convenience init(withNavigationOptions navigationOptions: [NavigationDrawerMenu]) {
        self.init(frame: .zero)
        self.navigationOptions = navigationOptions
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurateTableView()
    }

    private func configurateTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }

    func fillSuperview() {
        guard let superview = superview else { return }

        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NavigationDrawerView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return navigationOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = navigationOptions[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectOptionAt(index: indexPath.row)
    }
}
