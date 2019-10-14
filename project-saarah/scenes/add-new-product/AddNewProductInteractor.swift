//
//  AddNewProductInteractor.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AddNewProductBusinessLogic {
	func doSomething(request: AddNewProduct.Something.Request)
}

protocol AddNewProductDataStore {
	//var name: String { get set }
}

class AddNewProductInteractor: AddNewProductBusinessLogic, AddNewProductDataStore {
	var presenter: AddNewProductPresentationLogic?
//	var worker: AddNewProductWorker?
	//var name: String = ""

	// MARK: Do something
	func doSomething(request: AddNewProduct.Something.Request) {
//		worker = Worker()
//		worker?.doSomeWork()

		let response = AddNewProduct.Something.Response()
		presenter?.presentSomething(response: response)
	}
}
