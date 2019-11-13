//
//  BarcodeInteractor.swift
//  project-saarah
//
//  Created by Thiago Valente on 13/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol BarcodeBusinessLogic {
	func doSomething(request: Barcode.Something.Request)
}

protocol BarcodeDataStore {
	//var name: String { get set }
}

class BarcodeInteractor: BarcodeBusinessLogic, BarcodeDataStore {
	var presenter: BarcodePresentationLogic?
//	var worker: BarcodeWorker?
	//var name: String = ""

	// MARK: Do something
	func doSomething(request: Barcode.Something.Request) {
//		worker = Worker()
//		worker?.doSomeWork()

		let response = Barcode.Something.Response()
		presenter?.presentSomething(response: response)
	}
}
