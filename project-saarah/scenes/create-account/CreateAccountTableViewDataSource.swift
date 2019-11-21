//
//  CreateAccountTableViewDataSource.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class CreateAccountTableViewDataSource: SaarahFormTableViewDataSource {
    var tableViewSections = TableViewSections.allCases

    enum TableViewSections: Int, CaseIterable {
       case fields
       case button

      var reuseIdentifier: String {
          switch self {
          case .fields:
              return "TextFieldTableViewCell"
          case .button:
              return "PurpleButtonTableViewCell"
          }
      }
    }

    override func setFormFieldsViewModels() {
        formFieldsViewModels = [
            FormFieldViewModel(
                label: Localization(.createAccountScene(.field(.name))).description,
                placeholder: Localization(.createAccountScene(.field(.namePlaceholder))).description,
                identifier: "name",
                errorLabel: ""
            ),
            FormFieldViewModel(
                label: Localization(.createAccountScene(.field(.email))).description,
                placeholder: Localization(.createAccountScene(.field(.emailPlaceholder))).description,
                keyboardType: .email,
                identifier: "email",
                errorLabel: ""
            ),
            FormFieldViewModel(
                label: Localization(.createAccountScene(.field(.password))).description,
                placeholder: Localization(.createAccountScene(.field(.passwordPlaceholder))).description,
                keyboardType: .password,
                identifier: "password",
                errorLabel: ""
            ),
            FormFieldViewModel(
                label: Localization(.createAccountScene(.field(.confirmPassword))).description,
                placeholder: Localization(.createAccountScene(.field(.confirmPasswordPlaceholder))).description,
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
        return tableViewSections.count
	}

	func viewForHeader(in section: Int) -> UIView {
        guard let section = TableViewSections(rawValue: section) else { return UIView() }
        switch (section) {
        case .fields:
            let headerView = GreetingSectionHeaderView()
			headerView.setTitle(
                with: Localization(.createAccountScene(.header(.title))).description,
                andDescription: Localization(.createAccountScene(.header(.subtitle))).description
            )
			return headerView
        case .button:
            return EmptySectionHeaderView()
        }
	}

	func numberOfRows(in section: Int) -> Int {
        guard let section = TableViewSections(rawValue: section) else { return 0 }
        switch (section) {
        case .fields:
            return numberOfFields()
        case .button:
            return 1
        }
	}

	func cell (for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let section = TableViewSections(rawValue: indexPath.section) else { return UITableViewCell() }
        switch (section) {
        case .fields:
            return firstSection(for: tableView, in: indexPath)
        case .button:
            return secondSection(for: tableView, in: indexPath)
        }
	}

	func firstSection(for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
		return fieldCell(for: tableView, in: indexPath)
	}

    func secondSection(for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let section = TableViewSections(rawValue: indexPath.section),
            let cell = tableView.dequeueReusableCell(withIdentifier: section.reuseIdentifier, for: indexPath) as? PurpleButtonTableViewCell else { return UITableViewCell() }
        cell.setTitle(with: Localization(.createAccountScene(.createAccountButtonTitle)).description)
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
