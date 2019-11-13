//
//  BarcodePresenter.swift
//  project-saarah
//
//  Created by Thiago Valente on 13/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol BarcodePresentationLogic {
	func presentSomething(response: Barcode.Something.Response)
}

class BarcodePresenter: BarcodePresentationLogic {
	weak var viewController: BarcodeDisplayLogic?

	// MARK: Do something
	func presentSomething(response: Barcode.Something.Response) {
//		let viewModel = Barcode.Something.ViewModel()
//		viewController?.displaySomething(viewModel: viewModel)
	}
}
