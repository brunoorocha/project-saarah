//
//  CreateAccountViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol CreateAccountDisplayLogic: class {
	func displaySomething(viewModel: CreateAccount.Something.ViewModel)
}

class CreateAccountViewController: UIViewController, CreateAccountDisplayLogic {
	// MARK: Architeture Property
	var interactor: CreateAccountBusinessLogic?
	var router: (NSObjectProtocol & CreateAccountRoutingLogic & CreateAccountDataPassing)?

	// MARK: Controller Property
	private var contentView = CreateAccountView()

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()
		doSomething()
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
		title = "CreateAccount"
		view = contentView
	}

	// MARK: Do something
	func doSomething() {
		let request = CreateAccount.Something.Request()
		interactor?.doSomething(request: request)
	}

	func displaySomething(viewModel: CreateAccount.Something.ViewModel) {
	}
}
