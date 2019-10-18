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
//	var worker: AddProductItemWorker?
	var product: Product?
	var productItem: ProductLog?

	// MARK: Do something
	func addProductItem(request: AddProductItem.AddItem.Request) {
		// TODO: Create worker
//		worker = Worker()
//		worker?.doSomeWork()

		let response = AddProductItem.AddItem.Response(apiMessage: "success")
		presenter?.presentAPIResponse(response: response)
	}
}
