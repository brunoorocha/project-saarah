//
//  ProductItemViewController.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol ProductItemDisplayLogic: class {
	func displaySomething(viewModel: ProductItem.Something.ViewModel)
}

class ProductItemViewController: UIViewController, ProductItemDisplayLogic {
	// MARK: Architeture Property
	var interactor: ProductItemBusinessLogic?
	var router: (NSObjectProtocol & ProductItemRoutingLogic & ProductItemDataPassing)?

	// MARK: Controller Property
	private var contentView = ProductItemView()

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()
		doSomething()
	}

	// MARK: Init
	init() {
		super.init(nibName: nil, bundle: nil)
        ProductItemBuilder.build(aroundViewController: self)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func setupContentView() {
		title = "ProductItem"
		view = contentView
	}

	// MARK: Do something
	func doSomething() {
		let request = ProductItem.Something.Request()
		interactor?.doSomething(request: request)
	}

	func displaySomething(viewModel: ProductItem.Something.ViewModel) {
	}
}
