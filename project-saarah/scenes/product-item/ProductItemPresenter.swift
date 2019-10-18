//
//  ProductItemPresenter.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol ProductItemPresentationLogic {
	func presentSomething(response: ProductItem.Something.Response)
}

class ProductItemPresenter: ProductItemPresentationLogic {
	weak var viewController: ProductItemDisplayLogic?

	// MARK: Do something
	func presentSomething(response: ProductItem.Something.Response) {
//		let viewModel = ProductItem.Something.ViewModel()
//		viewController?.displaySomething(viewModel: viewModel)
	}
}
