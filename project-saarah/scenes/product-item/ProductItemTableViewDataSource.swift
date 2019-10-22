//
//  ProductItemTableViewDataSource.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductItemTableViewDataSource {
    var viewModel: ProductItem.FetchProductItem.ViewModel?
    var productViewModel: ProductItem.ReceiveProduct.ViewModel?

    func registerCells(for tableView: UITableView) {
        tableView.register(LabeledTableViewCell.self, forCellReuseIdentifier: "labeledTableViewCell")
        tableView.register(ProductItemTableViewCell.self, forCellReuseIdentifier: "productItemTableViewCell")
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: "buttonTableViewCell")
    }

    func reuseIdentifier(for section: Int) -> String {
        switch (section) {
        case 0:
            return "labeledTableViewCell"
        case 1:
            return "productItemTableViewCell"
        case 2:
            return "buttonTableViewCell"
        default:
            return ""
        }
    }

    func numberOfSections() -> Int {
        return 3
    }

    func numberOfRows(in section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        switch section {
        case 0:
            return 1
        case 1:
            return viewModel.DisplayProductItems.count
        case 2:
            return 1
        default:
            return 0
        }
    }

    func modify(_ cell: UITableViewCell, for indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return firstSection(cell)
        case 1:
            return secondSection(cell, for: indexPath.row)
        case 2:
            return thirdSection(cell)
        default:
            return UITableViewCell()
        }
    }

    func firstSection(_ cell: UITableViewCell) -> UITableViewCell {
        guard let cell = cell as? LabeledTableViewCell else { return UITableViewCell() }
        guard let viewModel = productViewModel else { return UITableViewCell() }

        cell.setupProductName(withName: viewModel.product.name)
        cell.roundCellIfNeeded(index: 0, numberOfCells: 1)

        return cell
    }

    func secondSection(_ cell: UITableViewCell, for row: Int) -> UITableViewCell {
        guard let cell = cell as? ProductItemTableViewCell else { return UITableViewCell() }
        guard let viewModel = viewModel else { return UITableViewCell() }

        let productItem = viewModel.DisplayProductItems[row]
        cell.setupNumericLabelsWith(amountText: productItem.amount, validityText: productItem.expiration, priceText: productItem.price, addedOnDayText: productItem.created)

        return cell
    }

    func thirdSection(_ cell: UITableViewCell) -> UITableViewCell {
        guard let cell = cell as? ButtonTableViewCell else { return UITableViewCell() }

        return cell
    }
}
