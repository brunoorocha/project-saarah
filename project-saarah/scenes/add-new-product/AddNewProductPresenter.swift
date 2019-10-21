//
//  AddNewProductPresenter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AddNewProductPresentationLogic {
	func presentAPIResponse(response: AddNewProduct.SaveProduct.Response)
}

class AddNewProductPresenter: AddNewProductPresentationLogic {
	weak var viewController: AddNewProductDisplayLogic?

	// MARK: Do something
	func presentAPIResponse(response: AddNewProduct.SaveProduct.Response) {
		switch (response.message) {
		case "success":
			let viewModel = AddNewProduct
                .SaveProduct.ResponseViewModel(success: true,
                                               title: "\(Localization(.addNewProductScene(.successResponseTitle)))",
                                               message: "\(Localization(.addNewProductScene(.successResponseMessage)))")
			viewController?.displayResponse(viewModel: viewModel)
		default:
			break
		}
	}
}
