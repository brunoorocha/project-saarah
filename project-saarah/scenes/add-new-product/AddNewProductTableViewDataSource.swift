//
//  AddNewProductTableViewDataSource.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 16/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class AddNewProductTableViewDataSource {
	func resgisterCells(for tableView: UITableView) {
		tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "TextFieldTableViewCell")
	}

	func reuseIdentifier(for section: Int) -> String {
		switch (section) {
		case 0:
			return "TextFieldTableViewCell"
		default:
			return ""
		}
	}

	func numberOfSections() -> Int {
		return 1
	}

	func numberOfRows(in section: Int) -> Int {
		return 3
	}

	func viewForHeader(in section: Int) -> UIView {
		switch (section) {
		case 0:
			let headerView = DefaultSectionHeaderView()
			headerView.titleLabel.text = "INFORMAÇÕES BÁSICAS"
			headerView.rightButton.isHidden = true
			return headerView
		default:
			return UIView()
		}
	}

	func modify(_ cell: UITableViewCell, for indexPath: IndexPath) -> UITableViewCell {
		switch (indexPath.section) {
		case 0:
			return firsSection(cell, for: indexPath.row)
		default:
			return UITableViewCell()
		}
	}

	func firsSection(_ cell: UITableViewCell, for row: Int) -> UITableViewCell {
		guard let cell = cell as? TextFieldTableViewCell else { return UITableViewCell() }
		cell.roundCellIfNeeded(index: row, numberOfCells: 3)

		switch (row) {
		case 0:
			cell.fieldLabel.text = "Nome do produto"
			cell.textField.placeholder = "Toque para digitar o nome do produto"
		case 1:
			cell.fieldLabel.text = "Código de barras (opcional)"
			cell.textField.placeholder = "Toque para inserir o código de barras"
		case 2:
			cell.fieldLabel.text = "Unidade de medidas"
			cell.textField.placeholder = "Quilos, gramas, litros..."
			cell.textField.isUserInteractionEnabled = false
		default:
			break
		}

		return cell
	}
}
