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

class LoginViewController: UIViewController, LoginDisplayLogic {
	// MARK: Architeture Property
	var interactor: LoginBusinessLogic?
	var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

	// MARK: Controller Property
	private var contentView = LoginView()

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()
		doSomething()
	}

	// MARK: Init
	init() {
		super.init(nibName: nil, bundle: nil)
        LoginBuilder.build(aroundViewController: self)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func setupContentView() {
		title = "Login"
		view = contentView
	}

	// MARK: Do something
	func doSomething() {
		let request = Login.Something.Request()
		interactor?.doSomething(request: request)
	}

	func displaySomething(viewModel: Login.Something.ViewModel) {
	}
}
