//
//  AddProductItemTableViewDataSource.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddProductItemTableViewDataSourceDelegate: class {
	func dismissDatePicker()
}

class AddProductItemTableViewDataSource {
	lazy var datePicker: UIDatePicker = {
		let picker = UIDatePicker()
		picker.datePickerMode = .date
		return picker
	}()
	lazy var toolBar: UIToolbar = {
		let toolbar = UIToolbar()
		toolbar.sizeToFit()
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePickAction))
		doneButton.tintColor = AppStyleGuide.Colors.primary.uiColor
		let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		toolbar.setItems([spaceButton, doneButton], animated: false)
		return toolbar
	}()

	weak var delegate: AddProductItemTableViewDataSourceDelegate?

	func resgisterCell(for tableView: UITableView) {
		tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "TextFieldTableViewCell")
	}

	func reuseIdentifier(for section: Int) -> String {
		return "TextFieldTableViewCell"
	}

	func numberOfSections() -> Int {
		return 2
	}

	func numberOfRows(in section: Int) -> Int {
		switch (section) {
		case 0:
			return 2
		case 1:
			return 1
		default:
			return 0
		}
	}

	func viewForHeader(in section: Int) -> UIView {
		switch (section) {
		case 0:
			let headerView = DefaultSectionHeaderView()
			headerView.titleLabel.text = "\(Localization(.addProductItemScene(.basicInformation)))"
			headerView.rightButton.isHidden = true
			return headerView
		case 1:
			let headerView = DefaultSectionHeaderView()
			headerView.titleLabel.text = "\(Localization(.addProductItemScene(.complementaryInformation)))"
			headerView.rightButton.isHidden = true
			return headerView
		default:
			return UIView()
		}
	}

	func modify(_ cell: UITableViewCell, for indexPath: IndexPath) -> UITableViewCell {
		switch (indexPath.section) {
		case 0:
			return firstSection(cell, for: indexPath.row)
		case 1:
			return secondSection(cell)
		default:
			return UITableViewCell()
		}
	}

	func firstSection(_ cell: UITableViewCell, for row: Int) -> UITableViewCell {
		guard let cell = cell as? TextFieldTableViewCell else { return UITableViewCell() }
		cell.roundCellIfNeeded(index: row, numberOfCells: 2)

		switch (row) {
		case 0:
			cell.fieldLabel.text = "\(Localization(.addProductItemScene(.quantity)))"
			// TODO: get the measure name o add in the end of placeholder
			cell.textField.placeholder = "\(Localization(.addProductItemScene(.quantityPlaceholder)))"
			cell.textField.keyboardType = .decimalPad
		case 1:
			cell.fieldLabel.text = "\(Localization(.addProductItemScene(.price)))"
			cell.textField.placeholder = "\(Localization(.addProductItemScene(.pricePlaceholder)))"
			cell.textField.keyboardType = .decimalPad
		default:
			break
		}

		return cell
	}

	func secondSection(_ cell: UITableViewCell) -> UITableViewCell {
		guard let cell = cell as? TextFieldTableViewCell else { return UITableViewCell() }
		cell.roundCellIfNeeded(index: 0, numberOfCells: 1)

		cell.fieldLabel.text = "\(Localization(.addProductItemScene(.expirationDate)))"
		cell.textField.placeholder = "\(Localization(.addProductItemScene(.expirationDatePlaceholder)))"
		cell.textField.inputAccessoryView = toolBar
		cell.textField.inputView = datePicker

		return cell
	}

	@objc func donePickAction() {
		delegate?.dismissDatePicker()
	}
}
