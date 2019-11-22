//
//  BarcodeInteractor.swift
//  project-saarah
//
//  Created by Thiago Valente on 13/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol BarcodeBusinessLogic {
	func readedProduct(request: Barcode.ProductReader.Request)
}

protocol BarcodeDataStore {
    var product: Product? {get set}
    var barcode: String? {get set}
}

class BarcodeInteractor: BarcodeBusinessLogic, BarcodeDataStore {
    var presenter: BarcodePresentationLogic?
//    var worker: BarcodeWorker?
    var product: Product?
    var barcode: String?

	// MARK: Do something
	func readedProduct(request: Barcode.ProductReader.Request) {
        barcode = request.barcode
//		worker = Worker()
//		worker?.doSomeWork()

		let response = Barcode.ProductReader.Response(product: nil)
		presenter?.presentProductFeedback(response: response)
	}
}
