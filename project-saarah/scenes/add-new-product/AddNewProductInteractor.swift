//
//  AddNewProductInteractor.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AddNewProductBusinessLogic {
	func saveNewProduct(request: AddNewProduct.SaveProduct.Request)
}

protocol AddNewProductDataStore {
	var product: Product? { get set }
}

class AddNewProductInteractor: AddNewProductBusinessLogic, AddNewProductDataStore {
	var presenter: AddNewProductPresentationLogic?
//	var worker: AddNewProductWorker?
	var product: Product?

	// MARK: Do something
	func saveNewProduct(request: AddNewProduct.SaveProduct.Request) {
		// TODO: Create worker for api
		let response = AddNewProduct.SaveProduct.Response(apiMessage: "success")
		presenter?.presentAPIResponse(response: response)
	}
}
