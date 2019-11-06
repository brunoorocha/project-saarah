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

class SettingsViewController: SaarahViewController, SettingsDisplayLogic {
	// MARK: Architeture Property
	var interactor: SettingsBusinessLogic?
	var router: (NSObjectProtocol & SettingsRoutingLogic & SettingsDataPassing)?
    var settingsTableViewDataSource = SettingsTableViewDataSource()

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
        SettingsBuilder.build(aroundViewController: self)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func setupContentView() {
		title = "\(Localization(.homeMenuOptionTitle(.settings)))"
		view = contentView
        contentView.tableView.dataSource = settingsTableViewDataSource
	}

	// MARK: Do something
	func doSomething() {
		let request = Settings.Something.Request()
		interactor?.doSomething(request: request)
	}

	func displaySomething(viewModel: Settings.Something.ViewModel) {
	}
}
