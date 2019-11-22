//
//  BarcodePresenter.swift
//  project-saarah
//
//  Created by Thiago Valente on 13/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol BarcodePresentationLogic {
	func presentProductFeedback(response: Barcode.ProductReader.Response)
}

class BarcodePresenter: BarcodePresentationLogic {
	weak var viewController: BarcodeDisplayLogic?

	// MARK: Do something
	func presentProductFeedback(response: Barcode.ProductReader.Response) {
        response.product != nil ? viewController?.productFound() : viewController?.productNotFound()
	}
}
