//
//  AddProductItemPresenter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AddProductItemPresentationLogic {
	func presentAPIResponse(response: AddProductItem.AddItem.Response)
}

class AddProductItemPresenter: AddProductItemPresentationLogic {
	weak var viewController: AddProductItemDisplayLogic?

	// MARK: Do something
	func presentAPIResponse(response: AddProductItem.AddItem.Response) {
		switch (response.apiMessage) {
		case "success":
			let viewModel = AddProductItem.AddItem.ViewModel.AddItemViewModel(success: true, title: "\(Localization(.addProductItemScene(.successResponseTitle)))", message: "\(Localization(.addProductItemScene(.successResponseMessage)))")
			viewController?.displayAPIResponse(viewModel: viewModel)
		default:
			break
		}
	}
}
