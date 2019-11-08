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
	
	func addProduct() {
		guard let productName = validateProductName() else {
			presentAlertModal("\(Localization(.addNewProductScene(.alertFormTitle)))", "\(Localization(.addNewProductScene(.alertFormName)))", "\(Localization(.addNewProductScene(.alertOkAction)))")
			return
		}
		
		let barCode = validateBarCode()
		if (!barCode.1) {
			presentAlertModal("\(Localization(.addNewProductScene(.alertFormTitle)))", "\(Localization(.addNewProductScene(.alertFormBarCode)))", "\(Localization(.addNewProductScene(.alertOkAction)))")
			return
		}
		
		if (!validadeSelectMeasure()) {
			presentAlertModal("\(Localization(.addNewProductScene(.alertFormTitle)))", "\(Localization(.addNewProductScene(.alertFormMeasure)))", "\(Localization(.addNewProductScene(.alertOkAction)))")
			
			return
		}
		
		let productForm = AddNewProduct.ProductForm(name: productName, barCode: barCode.0)
		let request = AddNewProduct.SaveProduct.Request(productForm: productForm)
		interactor?.saveNewProduct(request: request)
	}
	
	func validateProductName() -> String? {
		let indexPath = IndexPath(row: 0, section: 0)
		guard let cell = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return nil }
		guard let productName = cell.textField.text else { return nil }

		if (productName.isEmpty) {
			return nil
		}
		return productName
	}
	
	func validateBarCode() -> (String?, Bool) {
		let indexPath = IndexPath(row: 1, section: 0)
		guard let cell = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return (nil, true) }
		guard let barCode = cell.textField.text else { return (nil, true) }
        
		if (barCode.isEmpty) {
			return (nil, true)
		}
		if (barCode.isNumeric) {
			return (barCode, true)
		}
		
		return (nil, false)
	}
	
	func validadeSelectMeasure() -> Bool {
		let indexPath = IndexPath(row: 2, section: 0)
		guard let cell = contentView.tableView.cellForRow(at: indexPath) as? TextFieldTableViewCell else { return false }
		guard let measure = cell.textField.text else { return false }
		
		if (measure.isEmpty) {
			return false
		}
		return true
	}
}

extension AddNewProductViewController: AddNewProductViewDelegate {
	func cancelAction() {
		dismiss(animated: true, completion: nil)
	}

	func saveAction() {
		addProduct()
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
