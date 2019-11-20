//
//  SaarahFormTableViewDataSource.swift
//  project-saarah
//
//  Created by Bruno Rocha on 20/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SaarahFormTableViewDataSource: NSObject {
    var formFieldsViewModels = [FormFieldViewModel]()

    var formFieldsSection = 0

    var textFieldReuseIdentifier = "TextFieldTableViewCell"

    weak var textFieldDelegate: UITextFieldDelegate?

    // Used by controller in keyboard observer
    var selectedIndexPath: IndexPath?

    func registerCells(for tableView: UITableView) {
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: textFieldReuseIdentifier)
    }

    func numberOfFields () -> Int {
        return formFieldsViewModels.count
    }

    func fieldCell (for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: textFieldReuseIdentifier, for: indexPath) as? TextFieldTableViewCell else { return UITableViewCell() } // swiftlint:disable:this line_length
        let fieldViewModel = formFieldViewModel(for: indexPath)

        cell.fieldLabel.text = fieldViewModel.label
        cell.textField.accessibilityIdentifier = fieldViewModel.identifier
        cell.textField.placeholder = fieldViewModel.placeholder
        cell.textField.keyboardType = fieldViewModel.keyboardType == .email ? .emailAddress : .default
        cell.textField.isSecureTextEntry = fieldViewModel.keyboardType == .password
        cell.errorLabel.text = fieldViewModel.errorLabel
        cell.textField.delegate = textFieldDelegate
        cell.roundCellIfNeeded(index: indexPath.row, numberOfCells: formFieldsViewModels.count)

        return cell
    }

    func showErrorMessage (_ errorMessage: String, forFieldWithIdentifier identifier: String, in tableView: UITableView) {
        guard let indexPath = indexPathForField(withIdentifier: identifier),
            let cell = tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return }

        tableView.beginUpdates()
        let fieldViewModel = formFieldViewModel(for: indexPath)
        fieldViewModel.errorLabel = errorMessage
        cell.errorLabel.text = errorMessage
        tableView.endUpdates()
    }

    func clearFieldErrorMessage (forFieldWithIdentifier identifier: String, in tableView: UITableView) {
        guard let indexPath = indexPathForField(withIdentifier: identifier),
        let cell = tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return }

        let fieldViewModel = formFieldViewModel(for: indexPath)
        if (fieldViewModel.errorLabel == "") { return }

        tableView.beginUpdates()
        fieldViewModel.errorLabel = ""
        cell.clearErrors()
        tableView.endUpdates()
    }

    func clearAllFieldsErrorMessages (in tableView: UITableView) {
        formFieldsViewModels.forEach { formFieldViewModel in
            clearFieldErrorMessage(forFieldWithIdentifier: formFieldViewModel.identifier, in: tableView)
        }
    }

    func formFieldViewModel (for indexPath: IndexPath) -> FormFieldViewModel {
        return formFieldsViewModels[indexPath.row]
    }

    private func indexPathForField(withIdentifier identifier: String) -> IndexPath? {
        guard let row = formFieldsViewModels.firstIndex(where: { $0.identifier == identifier }) else { return nil }
        let indexPath = IndexPath(row: row, section: formFieldsSection)
        return indexPath
    }
}

extension SaarahFormTableViewDataSource: UITableViewDataSource {
    func numberOfSections (in tableView: UITableView) -> Int {
        return 1
    }

    func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfFields()
    }

    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return fieldCell(for: tableView, in: indexPath)
    }
}
