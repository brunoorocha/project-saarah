//
//  AddNewProductViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddNewProductDisplayLogic: class {
	func displayResponse(viewModel: AddNewProduct.SaveProduct.ViewModel.Response)
    func displayMeasureResponse(viewModel: AddNewProduct.GetMeasure.ViewModel.Measure)
	func productItemReceived()
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
		tableViewDataSource.registerCell(for: contentView.tableView)
		contentView.tableView.reloadData()
	}

	// MARK: Display new product response
	func displayResponse(viewModel: AddNewProduct.SaveProduct.ViewModel.Response) {
		let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        var okAction: UIAlertAction
		if (viewModel.success) {
			let addProductItemAction = UIAlertAction(title: "\(Localization(.addNewProductScene(.alertAddProductItemAction)))", style: .default) { (_) in
				self.router?.routeToAddProductItem()
			}
			addProductItemAction.setValue(AppStyleGuide.Colors.primary.uiColor, forKey: "titleTextColor")
			alert.addAction(addProductItemAction)

			okAction = UIAlertAction(title: "\(Localization(.addNewProductScene(.alertCancelAction)))", style: .cancel) { _ in
				self.router?.routeToListInventory()

			}
			okAction.setValue(AppStyleGuide.Colors.primary.uiColor, forKey: "titleTextColor")
			alert.addAction(okAction)
		} else {
            okAction = UIAlertAction(title: "\(Localization(.addNewProductScene(.alertOkAction)))", style: .default, handler: nil)
			okAction.setValue(AppStyleGuide.Colors.primary.uiColor, forKey: "titleTextColor")
			alert.addAction(okAction)
        }

		present(alert, animated: true, completion: nil)
	}

    // MARK: Display measure response
    func displayMeasureResponse(viewModel: AddNewProduct.GetMeasure.ViewModel.Measure) {
        let indexPath = IndexPath(row: 2, section: 0)
        guard let cell = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return }
        cell.textField.text = viewModel.name
    }

	func productItemReceived() {
		router?.dismissPresentedViewController()
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
		var barCode = cell1.textField.text
        barCode = barCode == "" ? nil : barCode

		let productForm = AddNewProduct.ProductForm(name: productName, barCode: barCode)
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
