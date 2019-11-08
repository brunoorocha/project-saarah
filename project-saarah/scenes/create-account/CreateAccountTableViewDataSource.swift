//
//  CreateAccountTableViewDataSource.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class CreateAccountTableViewDataSource: NSObject {
	func registerCells(for tableView: UITableView) {
		tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "TextFieldTableViewCell")
		tableView.register(PurpleButtonTableViewCell.self, forCellReuseIdentifier: "PurpleButtonTableViewCell")
	}

	func numberOfSections() -> Int {
		return 2
	}

	func reuseIdentifier(for section: Int) -> String {
		switch (section) {
		case 0:
			return "TextFieldTableViewCell"
		case 1:
			return "PurpleButtonTableViewCell"
		default:
			return ""
		}
	}

    // Used by controller in keyboard observer
    var selectedIndexPath: IndexPath?

    enum FormPosition: String {
        case name = "Name"
        case email = "Email"
        case password = "Password"
        case confirmPassword = "Confirm Password"
        case registerButton = "Register button"

        var indexPath: IndexPath {
            switch self {
            case .name:
                return IndexPath(row: 0, section: 0)
            case .email:
                return IndexPath(row: 1, section: 0)
            case .password:
                return IndexPath(row: 2, section: 0)
            case .confirmPassword:
                return IndexPath(row: 3, section: 0)
            case .registerButton:
                return IndexPath(row: 0, section: 1)
            }
        }
    }

	func viewForHeader(in section: Int) -> UIView {
		switch (section) {
		case 0:
			let headerView = GreetingSectionHeaderView()
			headerView.setTitle(with: "\(Localization(.createAccountScene(.headerTitle)))", andDescription: "\(Localization(.createAccountScene(.headerSubtitle)))")
			return headerView
		case 1:
			return EmptySectionHeaderView()
		default:
			return UIView()
		}
	}

	func numberOfRows(in section: Int) -> Int {
		switch (section) {
		case 0:
			return 4
		case 1:
			return 1
		default:
			return 0
		}
	}

	func modify( _ cell: UITableViewCell, for indexPath: IndexPath) -> UITableViewCell {
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
		cell.roundCellIfNeeded(index: row, numberOfCells: 4)

		switch (row) {
		case 0:
			cell.fieldLabel.text = "\(Localization(.createAccountScene(.nameCellTitle)))"
			cell.textField.placeholder = "\(Localization(.createAccountScene(.nameCellPlaceholder)))"
            cell.textField.accessibilityIdentifier = FormPosition.name.rawValue
		case 1:
			cell.fieldLabel.text = "\(Localization(.createAccountScene(.emailCellTitle)))"
			cell.textField.placeholder = "\(Localization(.createAccountScene(.emailCellPlaceholder)))"
            cell.textField.accessibilityIdentifier = FormPosition.email.rawValue
		case 2:
			cell.fieldLabel.text = "\(Localization(.createAccountScene(.passwordCellTitle)))"
			cell.textField.placeholder = "\(Localization(.createAccountScene(.passwordCellPlaceholder)))"
			cell.textField.isSecureTextEntry = true
            cell.textField.accessibilityIdentifier = FormPosition.password.rawValue
		case 3:
			cell.fieldLabel.text = "\(Localization(.createAccountScene(.confirmPasswordCellTitle)))"
			cell.textField.placeholder = "\(Localization(.createAccountScene(.confirmPasswordCellPlaceholder)))"
			cell.textField.isSecureTextEntry = true
            cell.textField.accessibilityIdentifier = FormPosition.confirmPassword.rawValue
		default:
			break
		}
        cell.textField.delegate = self
		return cell
	}

	func secondSection(_ cell: UITableViewCell) -> UITableViewCell {
		guard let cell = cell as? PurpleButtonTableViewCell else { return UITableViewCell() }
		cell.setTitle(with: "\(Localization(.createAccountScene(.createAccountButtonTitlle)))")
		return cell
	}
}

extension CreateAccountTableViewDataSource: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard let identifier = textField.accessibilityIdentifier else { return true }
        switch identifier {
        case FormPosition.name.rawValue:
            selectedIndexPath = FormPosition.name.indexPath
        case FormPosition.email.rawValue:
            selectedIndexPath = FormPosition.email.indexPath
        case FormPosition.password.rawValue:
            selectedIndexPath = FormPosition.password.indexPath
        case FormPosition.confirmPassword.rawValue:
            selectedIndexPath = FormPosition.confirmPassword.indexPath
        default:
            selectedIndexPath = nil
            return true
        }
        return true
    }
}
