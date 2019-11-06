//
//  SettingsTableViewDataSource.swift
//  project-saarah
//
//  Created by Bruno Rocha on 05/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SettingsTableViewDataSource: NSObject {
    var tableViewSections = SettingsTableViewSections.allCases

    enum SettingsTableViewSections: Int, CaseIterable {
        case loggout = 0

        var reusableIdentifier: String {
            switch self {
            case .loggout:
                return "DefaultCellTableViewCell"
            }
        }
    }

    func registerCells (for tableView: UITableView) {
        tableView.register(DefaultCellTableViewCell.self, forCellReuseIdentifier: SettingsTableViewSections.loggout.reusableIdentifier)
    }

    func numberOfRows (in section: Int) -> Int {
        guard let section = SettingsTableViewSections(rawValue: section) else { return 0 }
        switch section {
        case .loggout:
            return 1
        }
    }

    func cell (for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        defaultCell(for: tableView, in: indexPath)
    }

    private func defaultCell (for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let section = SettingsTableViewSections(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .loggout:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: section.reusableIdentifier, for: indexPath) as? DefaultCellTableViewCell else { return UITableViewCell() }
            cell.label.text = Localization(.settingsScene(.logoutText)).description
            cell.roundCellIfNeeded(index: indexPath.row, numberOfCells: numberOfRows(in: indexPath.section))
            return cell
        }
    }
}

extension SettingsTableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewSections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(for: tableView, in: indexPath)
    }
}
