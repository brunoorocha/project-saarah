//
//  LoginViewController.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {
	func displaySomething(viewModel: Login.Something.ViewModel)
}

protocol TappedButtonToSignUpDelegate: class {
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
            //self.view.frame.origin.y -= keyboardSize.height
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

	// MARK: Do something
	func doSomething() {
		let request = Login.Something.Request()
		interactor?.doSomething(request: request)
	}

	func displaySomething(viewModel: Login.Something.ViewModel) {
	}
}

extension LoginViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return loginTableViewDataSource.viewForHeader(in: section)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return loginTableViewDataSource.viewForFooter(in: section)
    }
}

extension LoginViewController: TappedButtonToSignUpDelegate {
    func tappedButtonToSignUp() {
        router?.routeToSignUp()
    }
}
