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
    let productWorker = ProductWorker(productService: ApiProductStore())
    var product: Product?
    var barcode: String?

	// MARK: Do something
	func readedProduct(request: Barcode.ProductReader.Request) {
        self.barcode = request.barcode
        productWorker.fetchProduct(by: request.barcode, { (product) in
            self.product = product
            let response = Barcode.ProductReader.Response(product: product)
            self.presenter?.presentProductFeedback(response: response)
        })
	}
}
