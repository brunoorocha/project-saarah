//
//  ListInventoryTableViewDataSource.swift
//  project-saarah
//
//  Created by Bruno Rocha on 23/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ListInventoryTableViewDataSource: NSObject {
    var viewModels = [ListInventory.FetchProducts.ViewModel.DisplayProduct]()
    var isShowingSkelectonCells = false
    var skelectonCellsCount = 5
    var tableViewSections = TableViewSections.allCases

    enum TableViewSections: Int, CaseIterable {
        case products = 0

        var reusableIdentifier: String {
            switch self {
            case .products:
                return "DefaultCellTableViewCell"
            }
        }

        var skelectonReusableIdentifier: String {
            switch self {
            case .products:
                return "DefaultCellSkelectonTableViewCell"
            }
        }
    }

    func registerCell (for tableView: UITableView) {
        tableView.register(DefaultCellTableViewCell.self, forCellReuseIdentifier: TableViewSections.products.reusableIdentifier)
        tableView.register(DefaultCellSkelectonTableViewCell.self, forCellReuseIdentifier: TableViewSections.products.skelectonReusableIdentifier)
    }

    func numberOfRows (in section: Int) -> Int {
        guard let section = TableViewSections(rawValue: section) else { return 0 }
        switch section {
        case .products:
            return isShowingSkelectonCells ? skelectonCellsCount : viewModels.count
        }
    }

    func cell (for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let section = TableViewSections(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .products:
            return productCell(for: tableView, in: indexPath)
        }
    }

    private func productCell (for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        if isShowingSkelectonCells {
            return productSkelectonCell(for: tableView, in: indexPath)
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewSections.products.reusableIdentifier, for: indexPath) as? DefaultCellTableViewCell else {
            return UITableViewCell()
        }
        let viewModel = viewModels[indexPath.row]
        cell.roundCellIfNeeded(index: indexPath.row, numberOfCells: viewModels.count)
        cell.label.text = viewModel.name
        cell.detailLabel.text = viewModel.quantity

        return cell
    }

    func viewForHeader (in section: Int) -> UIView? {
        guard let section = TableViewSections(rawValue: section) else { return nil }
        switch section {
        case .products:
            let header = DefaultSectionHeaderView()
            header.titleLabelText = Localization(.listInventoryScene(.productInStock)).description
            return header
        }
    }

    func productSkelectonCell (for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let skelectonCell = tableView.dequeueReusableCell(withIdentifier: TableViewSections.products.skelectonReusableIdentifier, for: indexPath) as? DefaultCellSkelectonTableViewCell else { return UITableViewCell() } // swiftlint:disable:this line_length
        skelectonCell.roundCellIfNeeded(index: indexPath.row, numberOfCells: skelectonCellsCount)
        return skelectonCell
    }
}

extension ListInventoryTableViewDataSource: UITableViewDataSource {
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
