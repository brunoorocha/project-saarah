//
//  LoginViewController.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {
    func displaySignInResponse(viewModel: Login.LogIn.ViewModel.LoginViewModel)
    func displayFormErrors(viewModels: [Login.LogIn.ViewModel.FormError])
}

protocol TappedButtonLoginDelegate: class {
    func tappedButtonToSignUp()
}

class LoginViewController: UIViewController, LoginDisplayLogic {

	// MARK: Architeture Property
	var interactor: LoginBusinessLogic?
	var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

    // MARK: Controller Property
    private var loginTableViewDataSource = LoginTableViewDataSource()
	private var contentView = LoginView()
    private var scrolledIndexPath: IndexPath?
    private var isLogin: Bool = false {
        didSet {
            self.isLogin ? showFullScreenActivityIndicator() : hideFullScreenActivityIndicator()
        }
    }

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
        defaultViewControllerConfiguration()
        navigationController?.isNavigationBarHidden = true

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
	}

    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            let userInfo = notification.userInfo!
            guard var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)

            var contentInset: UIEdgeInsets = contentView.tableView.contentInset
            contentInset.bottom = keyboardFrame.size.height
            contentView.tableView.contentInset = contentInset

            guard let indexPath = loginTableViewDataSource.selectedIndexPath else { return }
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
        LoginBuilder.build(aroundViewController: self)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func defaultViewControllerConfiguration() {
		view = contentView
        contentView.tableView.delegate = self
        loginTableViewDataSource.registerCells(for: contentView.tableView)
        contentView.tableView.dataSource = loginTableViewDataSource
        loginTableViewDataSource.delegate = self
	}

    func displaySignInResponse(viewModel: Login.LogIn.ViewModel.LoginViewModel) {
        isLogin = false
        if viewModel.success {
            router?.routeToHome()
        } else {
            presentAlertModal(
                "\(Localization(.loginScene(.errorFormValidation(.alertTitle))))",
                "\(Localization(.loginScene(.errorFormValidation(.undefined))))",
                "\(Localization(.loginScene(.errorFormValidation(.action))))"
            )
        }
    }

    func displayFormErrors(viewModels: [Login.LogIn.ViewModel.FormError]) {
        isLogin = false
        print(viewModels)
    }

    func doLogin() {
        guard let email = getFieldEmail() else {
            presentAlertModal(
                "\(Localization(.loginScene(.errorFormValidation(.alertTitle))))",
                "\(Localization(.loginScene(.errorFormValidation(.email))))",
                "\(Localization(.loginScene(.errorFormValidation(.action))))"
            )
            return
        }
        guard let password = getFieldPassword() else {
            presentAlertModal(
                "\(Localization(.loginScene(.errorFormValidation(.alertTitle))))",
                "\(Localization(.loginScene(.errorFormValidation(.password))))",
                "\(Localization(.loginScene(.errorFormValidation(.action))))"
            )
            return
        }
        isLogin = true
        let form = Login.LogIn.Form(email: email, passowrd: password)
        let request = Login.LogIn.Request(form: form)
        interactor?.logIn(request: request)
    }

}

extension LoginViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return loginTableViewDataSource.viewForHeader(in: section)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return loginTableViewDataSource.viewForFooter(in: section)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if LoginTableViewDataSource.FormPosition.loginButton.indexPath == indexPath
           && !isLogin {
            doLogin()
        }
    }
}

extension LoginViewController: TappedButtonLoginDelegate {
    func tappedButtonToSignUp() {
        router?.routeToSignUp()
    }
}

// MARK: Get fields values
extension LoginViewController {
    func getFieldEmail() -> String? {
        let indexPath = IndexPath(row: 0, section: 0)
        guard let cell = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return nil }
        guard let email = cell.textField.text else { return nil }

        if (email.isEmpty) {
            return nil
        }
        return email
    }

    func getFieldPassword() -> String? {
        let indexPath = IndexPath(row: 1, section: 0)
        guard let cell = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return nil }
        guard let password = cell.textField.text else { return nil }

        if (password.isEmpty) {
            return nil
        }
        return password
    }
}
