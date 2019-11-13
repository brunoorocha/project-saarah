//
//  BarcodeViewController.swift
//  project-saarah
//
//  Created by Thiago Valente on 13/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol BarcodeDisplayLogic: class {
	func displaySomething(viewModel: Barcode.Something.ViewModel)
}

class BarcodeViewController: UIViewController, BarcodeDisplayLogic {
	// MARK: Architeture Property
	var interactor: BarcodeBusinessLogic?
	var router: (NSObjectProtocol & BarcodeRoutingLogic & BarcodeDataPassing)?

	// MARK: Controller Property
	private var contentView = BarcodeView()

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()
		doSomething()
	}

	// MARK: Init
	init() {
		super.init(nibName: nil, bundle: nil)
        BarcodeBuilder.build(aroundViewController: self)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func setupContentView() {
		title = "Barcode"
		view = contentView
	}

	// MARK: Do something
	func doSomething() {
		let request = Barcode.Something.Request()
		interactor?.doSomething(request: request)
	}

	func displaySomething(viewModel: Barcode.Something.ViewModel) {
	}
}
