//
//  AddNewProductTableViewDataSource.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 16/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class AddNewProductTableViewDataSource {
	func registerCell(for tableView: UITableView) {
		tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "TextFieldTableViewCell")
	}

	func reuseIdentifier(for section: Int) -> String {
		return "TextFieldTableViewCell"
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
            headerView.titleLabel.text = (Localization(.addNewProductScene(.basicInformation)).description).uppercased()
			headerView.rightButton.isHidden = true
			return headerView
		default:
			return UIView()
		}
	}

	func modify(_ cell: UITableViewCell, for indexPath: IndexPath) -> UITableViewCell {
		return firstSection(cell, for: indexPath.row)
	}

    var barcodeReceived: String?

	func firstSection(_ cell: UITableViewCell, for row: Int) -> UITableViewCell {
		guard let cell = cell as? TextFieldTableViewCell else { return UITableViewCell() }
		cell.roundCellIfNeeded(index: row, numberOfCells: 3)

		switch (row) {
		case 0:
            cell.fieldLabel.text = Localization(.addNewProductScene(.field(.productName))).description
            cell.textField.placeholder = Localization(.addNewProductScene(.field(.productNamePlaceholder))).description
		case 1:
            cell.fieldLabel.text = Localization(.addNewProductScene(.field(.barCode))).description
            cell.textField.placeholder = Localization(.addNewProductScene(.field(.barCodePlacehoder))).description
            cell.textField.text = barcodeReceived
		case 2:
            cell.fieldLabel.text = Localization(.addNewProductScene(.field(.measure))).description
            cell.textField.placeholder = Localization(.addNewProductScene(.field(.measurePlaceholder))).description
            cell.showDisclosureIndicator()
			cell.textField.isUserInteractionEnabled = false
		default:
			break
		}

		return cell
	}
}
