//
//  ProductDetailInteractor.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol ProductDetailBusinessLogic {
	func getProduct(request: ProductDetail.GetProduct.Request)
}

protocol ProductDetailDataStore {
	var product: Product? { get set }
}

class ProductDetailInteractor: ProductDetailBusinessLogic, ProductDetailDataStore {
	var presenter: ProductDetailPresentationLogic?
//	var worker: ProductDetailWorker?
	var product: Product?

	// MARK: Do something
	func getProduct(request: ProductDetail.GetProduct.Request) {
		if let product = product {

			let response = ProductDetail.GetProduct.Response(product: product)
			presenter?.presentProduct(response: response)
		}
	}
}
