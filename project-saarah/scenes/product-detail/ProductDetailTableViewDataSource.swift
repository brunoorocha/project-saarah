//
//  Teste.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductDetailTableViewDataSource {
	var viewModel: ProductDetail.GetProduct.ViewModel?

	func resgisterCells(for tableView: UITableView) {
		tableView.register(LabeledTableViewCell.self, forCellReuseIdentifier: "LabeledTableViewCell")
		tableView.register(DefaultCellTableViewCell.self, forCellReuseIdentifier: "DefaultCellTableViewCell")
		tableView.register(ProductActivityTableViewCell.self, forCellReuseIdentifier: "ProductActivityTableViewCell")
	}

	func reuseIdentifier(for section: Int) -> String {
		switch (section) {
		case 0:
			return "LabeledTableViewCell"
		case 1:
			return "DefaultCellTableViewCell"
		case 2:
			return "ProductActivityTableViewCell"
		default:
			return ""
		}
	}

	func numberOfSections() -> Int {
        guard let viewModel = viewModel else { return 0 }

        if (viewModel.logsViewModels.count == 0) {
            return 2
        }
		return 3
	}

	func numberOfRows(in section: Int) -> Int {
		if let viewModel = viewModel {
			switch (section) {
			case 0:
				return 2
			case 1:
				return 1
			case 2:
				return viewModel.logsViewModels.count
			default:
				return 0
			}
		}

		return 0
	}

	func viewForHeader(in section: Int) -> UIView {
		switch (section) {
		case 0:
			let headerView = DefaultSectionHeaderView()
			headerView.titleLabel.text = "INFORMAÇÕES BÁSICAS"
			headerView.rightButton.isHidden = true
			return headerView
		case 1:
			return EmptySectionHeaderView()
		case 2:
			let headerView = DefaultSectionHeaderView()
			headerView.titleLabel.text = "ATIVIDADE"
			headerView.rightButton.setTitle("VER TODAS", for: .normal)
			return headerView
		default:
			return UIView()
		}
	}

	func modify(_ cell: UITableViewCell, for indexPath: IndexPath) -> UITableViewCell {
		switch (indexPath.section) {
		case 0:
			return firsSection(cell, for: indexPath.row)
		case 1:
			return secondSection(cell)
		case 2:
			return thirdSection(cell, for: indexPath.row)
		default:
			return UITableViewCell()
		}
	}

	func firsSection(_ cell: UITableViewCell, for row: Int) -> UITableViewCell {
		guard let cell = cell as? LabeledTableViewCell else { return UITableViewCell() }
		guard let viewModel = viewModel else { return UITableViewCell() }

		if (row == 0) {
			cell.setContent(title: "Nome do produto", subtitle: viewModel.productViewModel.name)
		} else {
			cell.setContent(title: "Quantidade em estoque", subtitle: viewModel.productViewModel.quantity)
		}
        
        cell.roundCellIfNeeded(index: row, numberOfCells: 2)

		return cell
	}

	func secondSection(_ cell: UITableViewCell) -> UITableViewCell {
		guard let cell = cell as? DefaultCellTableViewCell else { return UITableViewCell() }
		cell.roundCellIfNeeded(index: 0, numberOfCells: 1)

		cell.label.text = "Ver todos os itens desse produto"
		cell.detailLabel.text = ""

		return cell
	}

	func thirdSection(_ cell: UITableViewCell, for row: Int) -> UITableViewCell {
		guard let cell = cell as? ProductActivityTableViewCell else { return UITableViewCell() }
		guard let viewModel = viewModel else { return UITableViewCell() }
		cell.roundCellIfNeeded(index: row, numberOfCells: viewModel.logsViewModels.count)

		let logViewModel = viewModel.logsViewModels[row]
		cell.dateLabel.text = logViewModel.date
		cell.label.text = logViewModel.message
		cell.activityIcon.image = logViewModel.activityIcon.image

		return cell
	}
}
