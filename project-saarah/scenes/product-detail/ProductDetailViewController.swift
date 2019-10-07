//
//  ProductDetailViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol ProductDetailDisplayLogic: class {
	func displaySomething(viewModel: ProductDetail.Something.ViewModel)
}

class ProductDetailViewController: UIViewController, ProductDetailDisplayLogic {
	// MARK: Architeture Property
	var interactor: ProductDetailBusinessLogic?
	var router: (NSObjectProtocol & ProductDetailRoutingLogic & ProductDetailDataPassing)?

	// MARK: Controller Property
	private var contentView = ProductDetailView()

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
	func doSomething() {
		let request = ProductDetail.Something.Request()
		interactor?.doSomething(request: request)
	}

	func displaySomething(viewModel: ProductDetail.Something.ViewModel) {
	}
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)
	}
}
