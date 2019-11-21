//
//  CreateAccountViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol CreateAccountDisplayLogic: class {
	func displaySignUpSuccessResponse()
    func displaySignUpFailureResponse(viewModels: [CreateAccount.SignUp.ViewModel.FormErrorViewModel])
}

class CreateAccountViewController: UIViewController, CreateAccountDisplayLogic {
	// MARK: Architeture Property
	var interactor: CreateAccountBusinessLogic?
	var router: (NSObjectProtocol & CreateAccountRoutingLogic & CreateAccountDataPassing)?

	// MARK: Controller Property
	private var contentView = CreateAccountView()
	private let tableViewDataSource = CreateAccountTableViewDataSource()
    private var scrolledIndexPath: IndexPath?

    var isCreatingAccount = false {
        didSet {
            self.isCreatingAccount ? showFullScreenActivityIndicator() : hideFullScreenActivityIndicator()
        }
    }

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
	}

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            let userInfo = notification.userInfo!
            guard var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)

            var contentInset: UIEdgeInsets = contentView.tableView.contentInset
            contentInset.bottom = keyboardFrame.size.height
            contentView.tableView.contentInset = contentInset

            guard let indexPath = tableViewDataSource.selectedIndexPath else { return }
            contentView.tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            let contentInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            contentView.tableView.contentInset = contentInset
        }
    }

	// MARK: Init
	init() {
		super.init(nibName: nil, bundle: nil)
        CreateAccountBuilder.build(aroundViewController: self)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func setupContentView() {
		contentView.tableView.delegate = self
		contentView.tableView.dataSource = tableViewDataSource
		tableViewDataSource.registerCells(for: contentView.tableView)
        tableViewDataSource.textFieldDelegate = self
		contentView.tableView.reloadData()

		view.addSubview(contentView)
		NSLayoutConstraint.activate([
			contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			contentView.topAnchor.constraint(equalTo: view.topAnchor),
			contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}

	// MARK: Do something
	func displaySignUpSuccessResponse() {
		isCreatingAccount = false
        router?.routeToHome()
	}

    func displaySignUpFailureResponse(viewModels: [CreateAccount.SignUp.ViewModel.FormErrorViewModel]) {
        isCreatingAccount = false
        viewModels.forEach { formErrorViewModel in
            tableViewDataSource.showErrorMessage(formErrorViewModel.message, forFieldWithIdentifier: formErrorViewModel.field, in: contentView.tableView)
        }
    }

	func createAccount() { // swiftlint:disable:this function_body_length
        tableViewDataSource.clearAllFieldsErrorMessages(in: contentView.tableView)

		guard let name = validateName() else {
            tableViewDataSource.showErrorMessage(
                Localization(.createAccountScene(.errorFormNameMessage)).description,
                forFieldWithIdentifier: "name", in: contentView.tableView
            )
			return
		}

		guard let email = validateEmail() else {
			tableViewDataSource.showErrorMessage(
                Localization(.createAccountScene(.errorFormEmailMessage)).description,
                forFieldWithIdentifier: "email", in: contentView.tableView
            )
			return
		}

		if (!email.isValidEmail()) {
            tableViewDataSource.showErrorMessage(
                Localization(.createAccountScene(.errorFormInvalidEmail)).description,
                forFieldWithIdentifier: "email", in: contentView.tableView
            )
			return
		}

		guard let password = validatePassword() else {
            tableViewDataSource.showErrorMessage(
                Localization(.createAccountScene(.errorFormPasswordMessage)).description,
                forFieldWithIdentifier: "password", in: contentView.tableView
            )
			return
		}

		guard let confirmPassword = validateConfirmPassword() else {
            tableViewDataSource.showErrorMessage(
                Localization(.createAccountScene(.errorFormConfirmPasswordMessage)).description,
                forFieldWithIdentifier: "passwordConfirmation", in: contentView.tableView
            )
			return
		}

		if (password != confirmPassword) {
			tableViewDataSource.showErrorMessage(
                Localization(.createAccountScene(.errorFormPasswordsDontMatchMessage)).description,
                forFieldWithIdentifier: "passwordConfirmation", in: contentView.tableView
            )
			return
		}

		if (password.count < 6) {
            tableViewDataSource.showErrorMessage(
                Localization(.createAccountScene(.errorFormPasswordSize)).description,
                forFieldWithIdentifier: "password", in: contentView.tableView
            )
			return
		}

		isCreatingAccount = true
		let signUpForm = CreateAccount.SignUpForm(name: name, email: email, password: password, confirmPassword: confirmPassword)
		let request = CreateAccount.SignUp.Request(signUpForm: signUpForm)
		interactor?.signUp(request: request)
	}

	func validateName() -> String? {
		let indexPath = IndexPath(row: 0, section: 0)
		guard let cell = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return nil }
		guard let name = cell.textField.text else { return nil }

		if (name.isEmpty) {
			return nil
		}
		return name
	}

	func validateEmail() -> String? {
		let indexPath = IndexPath(row: 1, section: 0)
		guard let cell = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return nil }
		guard let email = cell.textField.text else { return nil }

		if (email.isEmpty) {
			return nil
		}
		return email
	}

	func validatePassword() -> String? {
		let indexPath = IndexPath(row: 2, section: 0)
		guard let cell = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return nil }
		guard let password = cell.textField.text else { return nil }

		if (password.isEmpty) {
			return nil
		}
		return password
	}

	func validateConfirmPassword() -> String? {
		let indexPath = IndexPath(row: 3, section: 0)
		guard let cell = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return nil }
		guard let confirmPassword = cell.textField.text else { return nil }

		if (confirmPassword.isEmpty) {
			return nil
		}
		return confirmPassword
	}
}

extension CreateAccountViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return tableViewDataSource.viewForHeader(in: section)
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if (indexPath.section == 1 && indexPath.row == 0 && !isCreatingAccount) {
			createAccount()
		}
	}
}

extension CreateAccountViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
       guard let identifier = textField.accessibilityIdentifier,
           let row = tableViewDataSource.formFieldsViewModels.firstIndex(where: { $0.identifier == identifier }) else { return true }
       tableViewDataSource.clearFieldErrorMessage(forFieldWithIdentifier: identifier, in: contentView.tableView)
        tableViewDataSource.selectedIndexPath = IndexPath(row: row, section: tableViewDataSource.formFieldsSection)
       return true
   }
}
