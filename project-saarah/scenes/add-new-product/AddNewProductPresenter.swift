//
//  AddNewProductPresenter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AddNewProductPresentationLogic {
    func presentSaveProductResponse(response: AddNewProduct.SaveProduct.Response)
    func presentGetMeasureResponse(response: AddNewProduct.GetMeasure.Response)
	func productItemReceived()
    func presentGetBarcodeResponse(response: AddNewProduct.GetBarcode.Response)
}

class AddNewProductPresenter: AddNewProductPresentationLogic {

	weak var viewController: AddNewProductDisplayLogic?

	// MARK: Present save product
	func presentSaveProductResponse(response: AddNewProduct.SaveProduct.Response) {
        if response.success {
			let viewModel = AddNewProduct
                .SaveProduct.ViewModel.Response(success: true,
                                                title: Localization(.addNewProductScene(.response(.success(.title)))).description,
												message: Localization(.addNewProductScene(.response(.success(.message)))).description
            )
			viewController?.displayResponse(viewModel: viewModel)
		}
	}

    // MARK: Present measure
    func presentGetMeasureResponse(response: AddNewProduct.GetMeasure.Response) {
        let viewModel = AddNewProduct.GetMeasure.ViewModel.Measure(name: response.measure.name.capitalized)
        viewController?.displayMeasureResponse(viewModel: viewModel)
    }

	func productItemReceived() {
		viewController?.productItemReceived()
	}

    func presentGetBarcodeResponse(response: AddNewProduct.GetBarcode.Response) {
        let viewModel = AddNewProduct.GetBarcode.ViewModel(barcode: response.barcode)
        viewController?.barcodeReceived(viewModel: viewModel)
    }
}
