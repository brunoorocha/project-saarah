//
//  AddNewProductViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddNewProductDisplayLogic: class {
	func displayAPIResponse(viewModel: AddNewProduct.SaveProduct.ResponseAPIViewModel)
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
		title = "\(Localization(.addNewProductScene(.title)))"
		view = contentView
		contentView.delegate = self
		contentView.tableView.delegate = self
		contentView.tableView.dataSource = self
		tableViewDataSource.resgisterCell(for: contentView.tableView)
		contentView.tableView.reloadData()
	}

	// MARK: Do something
	func displayAPIResponse(viewModel: AddNewProduct.SaveProduct.ResponseAPIViewModel) {
		let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
		if (viewModel.success) {
			let okAction = UIAlertAction(title: "\(Localization(.addNewProductScene(.alertAction)))", style: .default) { _ in
				self.router?.routeToAddProductItem()
			}
			alert.addAction(okAction)
		} else {
			let okAction = UIAlertAction(title: "\(Localization(.addNewProductScene(.alertAction)))", style: .default, handler: nil)
			alert.addAction(okAction)
		}

		present(alert, animated: true, completion: nil)
	}
}

extension AddNewProductViewController: AddNewProductViewDelegate {
	func cancelAction() {
		dismiss(animated: true, completion: nil)
	}

	func saveAction() {
		var indexPath = IndexPath(row: 0, section: 0)
		guard let cell0 = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return }
		guard let productName = cell0.textField.text else { return }
		indexPath.row = 1
		guard let cell1 = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return }
		let barCode = cell1.textField.text
		indexPath.row = 2
		guard let cell2 = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return }
		guard let measure = cell2.textField.text else { return }

		let productForm = AddNewProduct.ProductForm(name: productName, barCode: barCode, measure: measure)
		let request = AddNewProduct.SaveProduct.Request(productForm: productForm)
		interactor?.saveNewProduct(request: request)
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
		if (indexPath.row == 2) {
			router?.routeToChooseMeasurement()
		}
	}
}
