//
//  AddNewProductInteractor.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AddNewProductBusinessLogic {
	func loadDefaultStatus(request: AddNewProduct.LoadDefaultStatus.Request)
}

protocol AddNewProductDataStore {
	//var name: String { get set }
}

class AddNewProductInteractor: AddNewProductBusinessLogic, AddNewProductDataStore {
	var presenter: AddNewProductPresentationLogic?
//	var worker: AddNewProductWorker?
	//var name: String = ""

	// MARK: Do something
	func loadDefaultStatus(request: AddNewProduct.LoadDefaultStatus.Request) {
		let response = AddNewProduct.LoadDefaultStatus.Response()
		presenter?.presentSomething(response: response)
	}
}
