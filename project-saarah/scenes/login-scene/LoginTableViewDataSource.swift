//
//  LoginTableViewDataSource.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class LoginTableViewDataSource: SaarahFormTableViewDataSource {

    var tableViewSections = LoginTableViewSections.allCases

    weak var delegate: TappedButtonLoginDelegate?

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

    override init() {
        super.init()
        formFieldsSection = LoginTableViewSections.login.rawValue
        setFormFieldsViewModels()
    }

    private func setFormFieldsViewModels () {
        formFieldsViewModels = [
            FormFieldViewModel(
                label: Localization(.loginScene(.textField(.mail))).description,
                placeholder: Localization(.loginScene(.textField(.mailPlaceholder))).description,
                keyboardType: .email,
                identifier: "email",
                errorLabel: ""
            ),

            FormFieldViewModel(
                label: Localization(.loginScene(.textField(.password))).description,
                placeholder: Localization(.loginScene(.textField(.passwordPlaceholder))).description,
                keyboardType: .password,
                identifier: "password",
                errorLabel: ""
            )
        ]
    }

    override func registerCells(for tableView: UITableView) {
        super.registerCells(for: tableView)
        tableView.register(PurpleButtonTableViewCell.self, forCellReuseIdentifier: LoginTableViewSections.loginButton.reuseIdentifier)
    }

    func numberOfRows(in section: Int) -> Int {
        guard let section = LoginTableViewSections(rawValue: section) else { return 0 }
        switch section {
        case .login:
            return numberOfFields()
        case .loginButton:
            return 1
        }
    }

    func viewForHeader(in section: Int) -> UIView? {
        guard let section = LoginTableViewSections(rawValue: section) else { return nil }
        switch section {
        case .login:
            let headerView = GreetingSectionHeaderView()
            headerView.setTitle(
                with: Localization(.loginScene(.greeting(.title))).description,
                andDescription: Localization(.loginScene(.greeting(.description))).description
            )
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
        return fieldCell(for: tableView, in: indexPath)
    }

    func secondSectionCell(for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LoginTableViewSections.loginButton.reuseIdentifier, for: indexPath) as? PurpleButtonTableViewCell else { return UITableViewCell() } // swiftlint:disable:this line_length

        cell.setTitle(with: Localization(.loginScene(.title)).description)
        return cell
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(for: tableView, in: indexPath)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewSections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows(in: section)
    }
}
