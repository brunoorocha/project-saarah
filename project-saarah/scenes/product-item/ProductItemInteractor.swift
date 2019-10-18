//
//  ProductItemInteractor.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol ProductItemBusinessLogic {
	func doSomething(request: ProductItem.Something.Request)
}

protocol ProductItemDataStore {
	//var name: String { get set }
}

class ProductItemInteractor: ProductItemBusinessLogic, ProductItemDataStore {
	var presenter: ProductItemPresentationLogic?
//	var worker: ProductItemWorker?
	//var name: String = ""

	// MARK: Do something
	func doSomething(request: ProductItem.Something.Request) {
//		worker = Worker()
//		worker?.doSomeWork()

		let response = ProductItem.Something.Response()
		presenter?.presentSomething(response: response)
	}
}
