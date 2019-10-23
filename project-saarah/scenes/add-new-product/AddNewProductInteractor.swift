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
    var measure: Measure? { get set }
}

class AddNewProductInteractor: AddNewProductBusinessLogic, AddNewProductDataStore {

    var presenter: AddNewProductPresentationLogic?
//    var worker: AddNewProductWorker?
    var product: Product?
    var measure: Measure? {
        didSet {
            guard let measure = self.measure else { return }
            let response = AddNewProduct.GetMeasure.Response(measure: measure)
            presenter?.presentGetMeasureResponse(response: response)
        }
    }

	// MARK: Save new product
	func saveNewProduct(request: AddNewProduct.SaveProduct.Request) {
		// TODO: Create worker for api
		let response = AddNewProduct.SaveProduct.Response(success: true)
		presenter?.presentSaveProductResponse(response: response)
	}
}
