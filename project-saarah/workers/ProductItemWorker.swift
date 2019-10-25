//
//  ProductItemWorker.swift
//  project-saarah
//
//  Created by Thiago Valente on 18/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol ProductItemStore {
	func fetchProductItems(productId: String, _ completion: @escaping (Result<[ProductLog]?, NetworkServiceError>) -> Void)
	func addProductItem(productId: String, price: Double, quantity: Double, expirationDate: String, _ completion: @escaping (Result<ProductLog?, NetworkServiceError>) -> Void)
}

class ProductItemWorker: ProductItemStore {

    let productItemService: ProductItemStore

    init(productItemService: ProductItemStore) {
        self.productItemService = productItemService
    }

	func fetchProductItems(productId: String, _ completion: @escaping (Result<[ProductLog]?, NetworkServiceError>) -> Void) {
		productItemService.fetchProductItems(productId: productId) { (result) in
			DispatchQueue.main.async {
				completion(result)
			}
		}
	}

	func addProductItem(productId: String, price: Double, quantity: Double, expirationDate: String, _ completion: @escaping (Result<ProductLog?, NetworkServiceError>) -> Void) {
		productItemService.addProductItem(productId: productId, price: price, quantity: quantity, expirationDate: expirationDate) { (result) in
			DispatchQueue.main.async {
				completion(result)
			}
		}
	}
}
