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
		switch (response.code) {
		case "999":
			let success = false
			let title = "\(Localization(.addProductItemScene(.response(.inputErrorTitle))))"
			var message = ""

			switch (response.message) {
			case "expirationDate":
				message = "\(Localization(.addProductItemScene(.response(.expirationDateMessage))))"
			default:
				break
			}

			let viewModel = AddProductItem.AddItem.ViewModel.AddItemViewModel(success: success, title: title, message: message)
			viewController?.displayResponse(viewModel: viewModel)
		case "100":
			let viewModel = AddProductItem.AddItem.ViewModel.AddItemViewModel(success: true, title: "\(Localization(.addProductItemScene(.response(.successTitle))))", message: "\(Localization(.addProductItemScene(.response(.suceessMessage))))")
			viewController?.displayResponse(viewModel: viewModel)
		default:
			break
		}
	}
}
