//
//  CreateAccountTableViewDataSource.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class CreateAccountTableViewDataSource: SaarahFormTableViewDataSource {

    override func setFormFieldsViewModels() {
        formFieldsViewModels = [
            FormFieldViewModel(
                label: Localization(.createAccountScene(.nameCellTitle)).description,
                placeholder: Localization(.createAccountScene(.nameCellPlaceholder)).description,
                identifier: "name",
                errorLabel: ""
            ),
            FormFieldViewModel(
                label: Localization(.createAccountScene(.emailCellTitle)).description,
                placeholder: Localization(.createAccountScene(.emailCellPlaceholder)).description,
                keyboardType: .email,
                identifier: "email",
                errorLabel: ""
            ),
            FormFieldViewModel(
                label: Localization(.createAccountScene(.passwordCellTitle)).description,
                placeholder: Localization(.createAccountScene(.passwordCellPlaceholder)).description,
                keyboardType: .password,
                identifier: "password",
                errorLabel: ""
            ),
            FormFieldViewModel(
                label: Localization(.createAccountScene(.confirmPasswordCellTitle)).description,
                placeholder: Localization(.createAccountScene(.confirmPasswordCellPlaceholder)).description,
                keyboardType: .password,
                identifier: "passwordConfirmation",
                errorLabel: ""
            )
        ]
    }

	override func registerCells(for tableView: UITableView) {
        super.registerCells(for: tableView)
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
			return numberOfFields()
		case 1:
			return 1
		default:
			return 0
		}
	}

	func cell (for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
		switch (indexPath.section) {
		case 0:
            return firstSection(for: tableView, in: indexPath)
		case 1:
			return secondSection(for: tableView, in: indexPath)
		default:
			return UITableViewCell()
		}
	}

	func firstSection(for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
		return fieldCell(for: tableView, in: indexPath)
	}

    func secondSection(for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier(for: indexPath.section), for: indexPath) as? PurpleButtonTableViewCell else { return UITableViewCell() }
        cell.setTitle(with: Localization(.createAccountScene(.createAccountButtonTitlle)).description)
		return cell
	}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(for: tableView, in: indexPath)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows(in: section)
    }
}
