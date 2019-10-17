//
//  AddProductItemPresenter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AddProductItemPresentationLogic {
	func presentSomething(response: AddProductItem.Something.Response)
}

class AddProductItemPresenter: AddProductItemPresentationLogic {
	weak var viewController: AddProductItemDisplayLogic?

	// MARK: Do something
	func presentSomething(response: AddProductItem.Something.Response) {
//		let viewModel = AddProductItem.Something.ViewModel()
//		viewController?.displaySomething(viewModel: viewModel)
	}
}
