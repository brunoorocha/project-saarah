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
	private let tableViewDataSource = CreateAccountTableViewDataSource()

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
		contentView.tableView.delegate = self
		contentView.tableView.dataSource = self
		tableViewDataSource.registerCells(for: contentView.tableView)
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
	func doSomething() {
		let request = CreateAccount.Something.Request()
		interactor?.doSomething(request: request)
	}

	func displaySomething(viewModel: CreateAccount.Something.ViewModel) {
	}
}

extension CreateAccountViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return tableViewDataSource.numberOfSections()
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableViewDataSource.numberOfRows(in: section)
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return tableViewDataSource.viewForHeader(in: section)
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let reuseIdentifier = tableViewDataSource.reuseIdentifier(for: indexPath.section)
		let reusableCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
		let cell = tableViewDataSource.modify(reusableCell, for: indexPath)
		return cell
	}
}
