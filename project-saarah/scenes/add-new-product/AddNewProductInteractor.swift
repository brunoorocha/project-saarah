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

protocol AddNewProductDataStore: SelectedMeasureReceptor, ProductItemReceptor, BarcodeReceptor {
	var product: Product? { get set }
}

class AddNewProductInteractor: AddNewProductBusinessLogic, AddNewProductDataStore {

    var presenter: AddNewProductPresentationLogic?

    var product: Product?
    var measureReceptor: Measure? {
        didSet {
            guard let measure = self.measureReceptor else { return }
            let response = AddNewProduct.GetMeasure.Response(measure: measure)
            presenter?.presentGetMeasureResponse(response: response)
        }
    }
	var productItem: ProductLog? {
		didSet {
			self.presenter?.productItemReceived()
		}
	}
    var barcodeReceptor: String? {
        didSet {
            guard let barcode = self.barcodeReceptor else { return }
            let response = AddNewProduct.GetBarcode.Response(barcode: barcode)
            presenter?.presentGetBarcodeResponse(response: response)
        }
    }

    let productWorker = ProductWorker(productService: ApiProductStore())

	// MARK: Save new product
	func saveNewProduct(request: AddNewProduct.SaveProduct.Request) {
        guard let measure = measureReceptor else { return }
        productWorker.addProduct(withName: request.productForm.name, andBarcode: request.productForm.barCode, andMeasureId: measure.id) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let product):
                    if product != nil {
                        self.product = product
                        let response = AddNewProduct.SaveProduct.Response(success: true)
                        self.presenter?.presentSaveProductResponse(response: response)
                    }
                case .failure(let error):
                    print(error)
                    let response = AddNewProduct.SaveProduct.Response(success: false)
                    self.presenter?.presentSaveProductResponse(response: response)
                }
            }
        }
	}
}
