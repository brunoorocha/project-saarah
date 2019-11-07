//
//  LoginTableViewDataSource.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class LoginTableViewDataSource: NSObject {

    var tableViewSections = LoginTableViewSections.allCases

    var delegate: TappedButtonToSignUpDelegate?

    enum LoginTableViewSections: Int, CaseIterable {
        case login
        case loginButton

       var reuseIdentifier: String {
           switch self {
           case .login:
               return "TextFieldTableViewCell"
           case .loginButton:
               return "PurpleButtonTableViewCell"
           }
       }
    }

    // Used by controller in keyboard observer
    var selectedIndexPath: IndexPath?

    enum LoginTableViewTextField: String {
        case mail = "Mail"
        case password = "Password"

        var indexPath: IndexPath {
            switch self {
            case .mail:
                return IndexPath(row: 0, section: 0)
            case .password:
                return IndexPath(row: 1, section: 0)
            }
        }
    }

    func registerCells(for tableView: UITableView) {
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: LoginTableViewSections.login.reuseIdentifier)
        tableView.register(PurpleButtonTableViewCell.self, forCellReuseIdentifier: LoginTableViewSections.loginButton.reuseIdentifier)
    }

    func numberOfRows(in section: Int) -> Int {
        guard let section = LoginTableViewSections(rawValue: section) else { return 0 }
        switch section {
        case .login:
            return 2
        case .loginButton:
            return 1
        }
    }

    func viewForHeader(in section: Int) -> UIView? {
        guard let section = LoginTableViewSections(rawValue: section) else { return nil }
        switch section {
        case .login:
            let headerView = GreetingSectionHeaderView()
            headerView.setTitle(with: "\(Localization(.loginScene(.greeting(.title))))",
                                andDescription: "\(Localization(.loginScene(.greeting(.description))))")
            return headerView
        case .loginButton:
            return EmptySectionHeaderView()
        }
    }

    func viewForFooter(in section: Int) -> UIView? {
        guard let section = LoginTableViewSections(rawValue: section) else { return nil }
        switch section {
        case .loginButton:
            let footer = RegisterSectionFooterView()
            footer.actionRegisterButton.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
            return footer
        default:
            return nil
        }
    }

    @objc func tapSignUpButton() {
        delegate?.tappedButtonToSignUp()
    }

    func cell(for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let section = LoginTableViewSections(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .login:
            return firstSectionCell(for: tableView, in: indexPath)
        case .loginButton:
            return secondSectionCell(for: tableView, in: indexPath)
        }
    }

    // MARK: Sections cells
    func firstSectionCell(for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LoginTableViewSections.login.reuseIdentifier, for: indexPath) as? TextFieldTableViewCell else { return UITableViewCell() } // swiftlint:disable:this line_length
        let row = indexPath.row
        cell.roundCellIfNeeded(index: row, numberOfCells: 2)

        switch (row) {
        case 0:
            cell.fieldLabel.text = "\(Localization(.loginScene(.textField(.mail))))"
            cell.textField.accessibilityIdentifier = LoginTableViewTextField.mail.rawValue
            cell.textField.keyboardType = .emailAddress
            cell.textField.placeholder = "\(Localization(.loginScene(.textField(.mailPlaceholder))))"
            cell.textField.delegate = self
        case 1:
            cell.fieldLabel.text = "\(Localization(.loginScene(.textField(.password))))"
            cell.textField.accessibilityIdentifier = LoginTableViewTextField.password.rawValue
            cell.textField.isSecureTextEntry = true
            cell.textField.placeholder = "\(Localization(.loginScene(.textField(.passwordPlaceHolder))))"
            cell.textField.delegate = self
        default:
            return UITableViewCell()
        }

        return cell
    }

    func secondSectionCell(for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LoginTableViewSections.loginButton.reuseIdentifier, for: indexPath) as? PurpleButtonTableViewCell else { return UITableViewCell() } // swiftlint:disable:this line_length

        cell.setTitle(with: "\(Localization(.loginScene(.title)))")

        return cell
    }
}

extension LoginTableViewDataSource: UITableViewDataSource {
    func numberOfSections (in tableView: UITableView) -> Int {
        return tableViewSections.count
    }

    func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows(in: section)
    }

    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(for: tableView, in: indexPath)
    }
}

extension LoginTableViewDataSource: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard let identifier = textField.accessibilityIdentifier else { return true }
        switch identifier {
        case LoginTableViewTextField.mail.rawValue:
            selectedIndexPath = LoginTableViewTextField.mail.indexPath
        case LoginTableViewTextField.password.rawValue:
            selectedIndexPath = LoginTableViewTextField.password.indexPath
        default:
            selectedIndexPath = nil
            return true
        }
        return true
    }
}
