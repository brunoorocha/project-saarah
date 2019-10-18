//
//  AddProductItemViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddProductItemDisplayLogic: class {
	func displayAPIResponse(viewModel: AddProductItem.AddItem.ViewModel.AddItemViewModel)
}

class AddProductItemViewController: UIViewController, AddProductItemDisplayLogic {
	// MARK: Architeture Property
	var interactor: AddProductItemBusinessLogic?
	var router: (NSObjectProtocol & AddProductItemRoutingLogic & AddProductItemDataPassing)?

	// MARK: Controller Property
	private var contentView = AddProductItemView()
	let tableViewDataSource = AddProductItemTableViewDataSource()

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()
	}

	// MARK: Init
	init() {
		super.init(nibName: nil, bundle: nil)
        AddProductItemBuilder.build(aroundViewController: self)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func setupContentView() {
		view = contentView
		contentView.delegate = self
		contentView.tableView.delegate = self
		contentView.tableView.dataSource = self
		tableViewDataSource.resgisterCells(for: contentView.tableView)
		contentView.tableView.reloadData()
	}

	// MARK: Do something
	func displayAPIResponse(viewModel: AddProductItem.AddItem.ViewModel.AddItemViewModel) {
		let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
		if (viewModel.success) {
			let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
				self.dismiss(animated: true, completion: nil)
			}
			alert.addAction(okAction)
		} else {
			let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
			alert.addAction(okAction)
		}

		present(alert, animated: true, completion: nil)
	}
}

extension AddProductItemViewController: AddProductItemViewDelegate {
	func cancelAction() {
		dismiss(animated: true, completion: nil)
	}

	func saveAction() {
		var indexPath = IndexPath(row: 0, section: 0)
		guard let cell0 = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return }
		guard let quantityString = cell0.textField.text else { return }
		guard let quantity = Double(quantityString) else { return }
		indexPath.row = 1
		guard let cell1 = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return }
		guard let priceString = cell1.textField.text else { return }
		guard let price = Double(priceString) else { return }
		indexPath.row = 0
		indexPath.item = 1
		guard let cell2 = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return }
		guard let expirationDate = cell2.textField.text else { return }

		let itemForm = AddProductItem.AddItemForm(quantity: quantity, price: price, expirationDate: expirationDate)
		let request = AddProductItem.AddItem.Request(addItemForm: itemForm)
		interactor?.addProductItem(request: request)
	}
}

extension AddProductItemViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return tableViewDataSource.numberOfSections()
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableViewDataSource.numberOfRows(in: section)
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return tableViewDataSource.viewForHeader(in: section)
	}

	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return tableViewDataSource.viewForFooter(in: section)
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let reuseIdentifier = tableViewDataSource.reuseIdentifier(for: indexPath.section)
		let reusableCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
		let cell = tableViewDataSource.modify(reusableCell, for: indexPath)
		return cell
	}
}
