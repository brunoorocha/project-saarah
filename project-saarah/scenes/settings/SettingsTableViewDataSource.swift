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
        case logout = 0

        var reusableIdentifier: String {
            switch self {
            case .logout:
                return "DefaultCellTableViewCell"
            }
        }
    }

    func registerCells (for tableView: UITableView) {
        tableView.register(DefaultCellTableViewCell.self, forCellReuseIdentifier: SettingsTableViewSections.logout.reusableIdentifier)
    }

    func numberOfRows (in section: Int) -> Int {
        guard let section = SettingsTableViewSections(rawValue: section) else { return 0 }
        switch section {
        case .logout:
            return 1
        }
    }

    func cell (for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        defaultCell(for: tableView, in: indexPath)
    }

    private func defaultCell (for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let section = SettingsTableViewSections(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .logout:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: section.reusableIdentifier, for: indexPath) as? DefaultCellTableViewCell else { return UITableViewCell() }
            cell.label.text = Localization(.settingsScene(.logoutText)).description
            cell.label.textColor = AppStyleGuide.Colors.red.uiColor
            cell.roundCellIfNeeded(index: indexPath.row, numberOfCells: numberOfRows(in: indexPath.section))
            return cell
        }
    }

    func viewForHeader(in section: Int) -> UIView? {
        guard let section = SettingsTableViewSections(rawValue: section) else { return nil }
        switch section {
        case .logout:
            return DefaultSectionHeaderView()
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
