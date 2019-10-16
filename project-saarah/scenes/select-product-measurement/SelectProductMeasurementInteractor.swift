//
//  SelectProductMeasurementInteractor.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol SelectProductMeasurementBusinessLogic {
	func doSomething(request: SelectProductMeasurement.Something.Request)
}

protocol SelectProductMeasurementDataStore {
	//var name: String { get set }
}

class SelectProductMeasurementInteractor: SelectProductMeasurementBusinessLogic, SelectProductMeasurementDataStore {
	var presenter: SelectProductMeasurementPresentationLogic?
//	var worker: SelectProductMeasurementWorker?
	//var name: String = ""

	// MARK: Do something
	func doSomething(request: SelectProductMeasurement.Something.Request) {
//		worker = Worker()
//		worker?.doSomeWork()

		let response = SelectProductMeasurement.Something.Response()
		presenter?.presentSomething(response: response)
	}
}
