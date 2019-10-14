//
//  AddNewProductPresenter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AddNewProductPresentationLogic {
	func presentSomething(response: AddNewProduct.Something.Response)
}

class AddNewProductPresenter: AddNewProductPresentationLogic {
	weak var viewController: AddNewProductDisplayLogic?

	// MARK: Do something
	func presentSomething(response: AddNewProduct.Something.Response) {
//		let viewModel = AddNewProduct.Something.ViewModel()
//		viewController?.displaySomething(viewModel: viewModel)
	}
}
