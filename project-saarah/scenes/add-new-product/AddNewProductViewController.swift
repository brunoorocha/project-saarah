//
//  AddNewProductViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddNewProductDisplayLogic: class {
	func displayDefaultStatus(viewModel: AddNewProduct.LoadDefaultStatus.ViewModel)
}

class AddNewProductViewController: SaarahViewController, AddNewProductDisplayLogic {
	// MARK: Architeture Property
	var interactor: AddNewProductBusinessLogic?
	var router: (NSObjectProtocol & AddNewProductRoutingLogic & AddNewProductDataPassing)?

	// MARK: Controller Property
	private var contentView = AddNewProductView()
	let tableViewDataSource = AddNewProductTableViewDataSource()

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()
		loadDefaultStatus()
	}

	// MARK: Init
	init() {
		super.init(nibName: nil, bundle: nil)
        AddNewProductBuilder.build(aroundViewController: self)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func setupContentView() {
		title = "Criar novo produto"
		view = contentView
	}

	// MARK: Do something
	func loadDefaultStatus() {
		let request = AddNewProduct.LoadDefaultStatus.Request()
		interactor?.loadDefaultStatus(request: request)
	}

	func displayDefaultStatus(viewModel: AddNewProduct.LoadDefaultStatus.ViewModel) {
		tableViewDataSource.viewModel = viewModel
		contentView.tableView.reloadData()
	}
}

extension AddNewProductViewController: UITableViewDelegate, UITableViewDataSource {
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
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
}
