//
//  SettingsViewController.swift
//  project-saarah
//
//  Created by Bruno Rocha on 05/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol SettingsDisplayLogic: class {
	func displaySomething(viewModel: Settings.Something.ViewModel)
}

class SettingsViewController: UIViewController, SettingsDisplayLogic {
	// MARK: Architeture Property
	var interactor: SettingsBusinessLogic?
	var router: (NSObjectProtocol & SettingsRoutingLogic & SettingsDataPassing)?

	// MARK: Controller Property
	private var contentView = SettingsView()

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()
		doSomething()
	}

	// MARK: Init
	init() {
		super.init(nibName: nil, bundle: nil)
		setupArchiteture()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	private func setupArchiteture() {
		let viewController = self
		let interactor = SettingsInteractor()
		let presenter = SettingsPresenter()
		let router = SettingsRouter()
		viewController.interactor = interactor
		viewController.router = router
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
		router.dataStore = interactor
	}

	func setupContentView() {
		title = "\(Localization(.homeMenuOptionTitle(.settings)))"
		view = contentView
	}

	// MARK: Do something
	func doSomething() {
		let request = Settings.Something.Request()
		interactor?.doSomething(request: request)
	}

	func displaySomething(viewModel: Settings.Something.ViewModel) {
	}
}
