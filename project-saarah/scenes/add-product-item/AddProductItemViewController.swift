//
//  AddProductItemViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddProductItemViewControllerDelegate: class {
	func pass(productItem: ProductLog)
}

protocol AddProductItemDisplayLogic: class {
	func displayResponse(viewModel: AddProductItem.AddItem.ViewModel.AddItemViewModel)
}

class AddProductItemViewController: UIViewController, AddProductItemDisplayLogic {
	// MARK: Architeture Property
	var interactor: AddProductItemBusinessLogic?
	var router: (NSObjectProtocol & AddProductItemRoutingLogic & AddProductItemDataPassing)?

	// MARK: Controller Property
	private var contentView = AddProductItemView()
	let tableViewDataSource = AddProductItemTableViewDataSource()

	weak var delegate: AddProductItemViewControllerDelegate?

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()
		tableViewDataSource.delegate = self
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
		tableViewDataSource.resgisterCell(for: contentView.tableView)
		contentView.tableView.reloadData()
	}

	// MARK: Do something
	func displayResponse(viewModel: AddProductItem.AddItem.ViewModel.AddItemViewModel) {
		let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
		if (viewModel.success) {
			let okAction = UIAlertAction(title: "\(Localization(.addProductItemScene(.alertActionTitle)))", style: .default) { _ in
				if (self.delegate != nil) {
					self.router?.routeToProductItem()
				} else {
					self.dismiss(animated: true, completion: nil)
				}
			}

            okAction.setValue(AppStyleGuide.Colors.primary.uiColor, forKey: "titleTextColor")

			alert.addAction(okAction)
		} else {
			let okAction = UIAlertAction(title: "\(Localization(.addProductItemScene(.alertActionTitle)))", style: .default, handler: nil)

            okAction.setValue(AppStyleGuide.Colors.primary.uiColor, forKey: "titleTextColor")

			alert.addAction(okAction)
		}

		present(alert, animated: true, completion: nil)
	}

	func saveProductItem() {
		guard let quantity = validateQuantity() else {
			presentAlertModal("\(Localization(.addProductItemScene(.errorFormAlertTitle)))", "\(Localization(.addProductItemScene(.errorFormQuantityAlertMessage)))", "\(Localization(.addProductItemScene(.errorFormActionAlertTitle)))")
			return
		}

		guard let price = validatePrice() else {
			presentAlertModal("\(Localization(.addProductItemScene(.errorFormAlertTitle)))", "\(Localization(.addProductItemScene(.errorFormPriceAlertMessage)))", "\(Localization(.addProductItemScene(.errorFormActionAlertTitle)))")
			return
		}

		guard let expiration = validateExpiration() else {
			presentAlertModal("\(Localization(.addProductItemScene(.errorFormAlertTitle)))", "\(Localization(.addProductItemScene(.errorFormExpirationAlertMessage)))", "\(Localization(.addProductItemScene(.errorFormActionAlertTitle)))")
			return
		}

		let itemForm = AddProductItem.AddItemForm(quantity: quantity, price: price, expirationDate: expiration)
		let request = AddProductItem.AddItem.Request(addItemForm: itemForm)
		interactor?.addProductItem(request: request)
	}

	func validateQuantity() -> Double? {
		let indexPath = IndexPath(row: 0, section: 0)
		guard let cell0 = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return nil }
		guard let quantityString = cell0.textField.text else { return nil }
		return Double(quantityString)
	}

	func validatePrice() -> Double? {
		let indexPath = IndexPath(row: 1, section: 0)
		guard let cell = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return nil }
		guard let priceString = cell.textField.text else { return nil }
		return Double(priceString)
	}

	func validateExpiration() -> String? {
		let indexPath = IndexPath(row: 0, section: 1)
		guard let cell2 = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return nil }
		guard let expirationText = cell2.textField.text else { return nil }
		return DateFormat.convertToCommaFromSlash(expirationText)
	}
}

extension AddProductItemViewController: AddProductItemTableViewDataSourceDelegate {
	func dismissDatePicker() {
		let date = tableViewDataSource.datePicker.date
		let dateString = DateFormat.withSlash(from: date)

		let indexPath = IndexPath(row: 0, section: 1)
		guard let cell2 = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return }
		cell2.textField.text = dateString

		view.endEditing(true)
	}
}

extension AddProductItemViewController: AddProductItemViewDelegate {
	func cancelAction() {
		dismiss(animated: true, completion: nil)
	}

	func saveAction() {
		saveProductItem()
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

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let reuseIdentifier = tableViewDataSource.reuseIdentifier(for: indexPath.section)
		let reusableCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
		let cell = tableViewDataSource.modify(reusableCell, for: indexPath)
		return cell
	}
}
