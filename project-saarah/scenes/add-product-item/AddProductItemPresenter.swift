//
//  AddProductItemPresenter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AddProductItemPresentationLogic {
	func presentResponse(response: AddProductItem.AddItem.Response)
}

class AddProductItemPresenter: AddProductItemPresentationLogic {
	weak var viewController: AddProductItemDisplayLogic?

	// MARK: Do something
	func presentResponse(response: AddProductItem.AddItem.Response) {
		if (response.productLog != nil) {
			let viewModel = AddProductItem.AddItem.ViewModel.AddItemViewModel(
                success: true,
                title: Localization(.addProductItemScene(.response(.successTitle))).description,
                message: Localization(.addProductItemScene(.response(.suceessMessage))).description
            )
			viewController?.displayResponse(viewModel: viewModel)
		} else {
			// TODO: create a vm to show the error returned by api
		}
	}
}
