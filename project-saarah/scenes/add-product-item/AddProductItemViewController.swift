//
//  AddProductItemViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddProductItemDisplayLogic: class {
	func displaySomething(viewModel: AddProductItem.Something.ViewModel)
}

class AddProductItemViewController: UIViewController, AddProductItemDisplayLogic {
	// MARK: Architeture Property
	var interactor: AddProductItemBusinessLogic?
	var router: (NSObjectProtocol & AddProductItemRoutingLogic & AddProductItemDataPassing)?

	// MARK: Controller Property
	private var contentView = AddProductItemView()

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()
		doSomething()
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
		title = "AddProductItem"
		view = contentView
	}

	// MARK: Do something
	func doSomething() {
		let request = AddProductItem.Something.Request()
		interactor?.doSomething(request: request)
	}

	func displaySomething(viewModel: AddProductItem.Something.ViewModel) {
	}
}
