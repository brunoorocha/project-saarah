//
//  AddProductItemInteractor.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AddProductItemBusinessLogic {
	func addProductItem(request: AddProductItem.AddItem.Request)
}

protocol AddProductItemDataStore {
	var product: Product? { get set }
	var productItem: ProductLog? { get set }
}

class AddProductItemInteractor: AddProductItemBusinessLogic, AddProductItemDataStore {
	var presenter: AddProductItemPresentationLogic?

	var product: Product?
	var productItem: ProductLog?

	let productItemWorker = ProductItemWorker(productItemService: MockProductItem())

	// MARK: Do something
	func addProductItem(request: AddProductItem.AddItem.Request) {
		productItemWorker.addProductItem { (response) in
			let response = AddProductItem.AddItem.Response(code: response.code, message: response.message)
			self.presenter?.presentResponse(response: response)
		}
	}
}
