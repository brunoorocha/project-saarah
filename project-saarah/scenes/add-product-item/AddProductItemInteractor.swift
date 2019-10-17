//
//  AddProductItemInteractor.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AddProductItemBusinessLogic {
	func doSomething(request: AddProductItem.Something.Request)
}

protocol AddProductItemDataStore {
	//var name: String { get set }
}

class AddProductItemInteractor: AddProductItemBusinessLogic, AddProductItemDataStore {
	var presenter: AddProductItemPresentationLogic?
//	var worker: AddProductItemWorker?
	//var name: String = ""

	// MARK: Do something
	func doSomething(request: AddProductItem.Something.Request) {
//		worker = Worker()
//		worker?.doSomeWork()

		let response = AddProductItem.Something.Response()
		presenter?.presentSomething(response: response)
	}
}
