//
//  ProductDetailViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol ProductDetailDisplayLogic: class {
	func displayProduct(viewModel: ProductDetail.GetProduct.ViewModel)
}

class ProductDetailViewController: UIViewController, ProductDetailDisplayLogic {
	// MARK: Architeture Property
	var interactor: ProductDetailBusinessLogic?
	var router: (NSObjectProtocol & ProductDetailRoutingLogic & ProductDetailDataPassing)?

	// MARK: Controller Property
	private var contentView = ProductDetailView()
	let teste = Teste()

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()
		getProduct()
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
		let interactor = ProductDetailInteractor()
		let presenter = ProductDetailPresenter()
		let router = ProductDetailRouter()
		viewController.interactor = interactor
		viewController.router = router
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
		router.dataStore = interactor
	}

	func setupContentView() {
		title = "ProductDetail"
		view = contentView
		contentView.tableView.delegate = self
		contentView.tableView.dataSource = self
	}

	// MARK: Do something
	func getProduct() {
		let request = ProductDetail.GetProduct.Request()
		interactor?.getProduct(request: request)
	}

	func displayProduct(viewModel: ProductDetail.GetProduct.ViewModel) {
		teste.viewModel = viewModel
		contentView.tableView.reloadData()
	}
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return teste.numberOfSections()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return teste.numberOfRows(in: section)
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return teste.viewForHeader(in: section)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let reuseIdentifier = teste.reuseIdentifier(for: indexPath.section)
		let reusableCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
		let cell = teste.modified(reusableCell, for: indexPath)
		return cell
	}
}
